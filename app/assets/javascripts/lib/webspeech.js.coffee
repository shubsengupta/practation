# Library to simplify implementation of Web Speech API.

# Designed to allow overwriting of nearly all attributes and function callbacks
# to implement custom behavior.

# Create and return new WebSpeechRecognition object.
WebSpeechRecognition = ->
  r = this
  r.continuous = false
  r.lang = ""
  r.maxAlternatives = 1
  r.status_array = status_array_en
  r.image_array = image_array_mic
  recognizing = false
  ignore_onend = undefined
  
  # Return false if speech recognition is unavailable. (Typically occurs
  # when using a browser that does not support it.)
  r.supported = ->
    !!r.recognition

  
  # Sets the object which will receive status as text messages.
  r.statusText = (id) ->
    r.status_elem = r.getElem(id)
    r.refreshState()

  
  # Sets the object which will receive status as images.
  r.statusImage = (id) ->
    r.image_elem = r.getElem(id)
    r.refreshState()

  
  # Sets the object which will receive final text results.
  r.finalResults = (id) ->
    r.final_results = r.getElem(id)

  
  # Sets the object which will receive interim text results.
  r.interimResults = (id) ->
    r.interim_results = r.getElem(id)

  
  # Return true if recognition is in progress.
  r.inProgress = ->
    recognizing

  
  # Start recognition.
  r.start = ->
    recognizing = true
    ignore_onend = false
    r.final_transcript = ""
    r.setText r.final_results, ""
    r.setText r.interim_results, ""
    r.recognition.continuous = r.continuous
    r.recognition.interimResults = !!r.interim_results
    r.recognition.maxAlternatives = r.maxAlternatives
    r.recognition.lang = r.lang  unless r.lang is ""
    r.recognition.start()
    r.onState "allow"

  
  # Stop recognition.
  r.stop = ->
    recognizing = false
    r.recognition.stop()

  
  # Toggle recognition between Start and Stop states.
  r.toggleStartStop = ->
    if reco.inProgress()
      reco.stop()
    else
      reco.start()

  
  #
  # All functions below are rarely called directly by the web page.
  #
  r.onState = (key) ->
    r.onStatusChange key
    r.onImageChange key
    r.currentState = key

  r.refreshState = ->
    r.onState r.currentState

  
  # Set status field to text corresponding to key.  See status_array for valid
  # values of key.  An invalid value of key will hide the status message.
  r.onStatusChange = (key) ->
    unless not r.status_elem
      s = r.status_array[key]
      if s
        r.setText r.status_elem, s
        r.status_elem.style.visibility = "visible"
      else
        r.status_elem.style.visibility = "hidden"

  
  # Set button image corresponding to key. See image_array for valid values of
  # key.  An invalid value of key will show the image in its 'disable' state.
  r.onImageChange = (key) ->
    unless not r.image_elem
      f = r.image_array[key]
      f = r.image_array["disable"]  unless f
      r.image_elem.src = f

  r.setText = (elem, text) ->
    Backbone.Events.trigger('voiceTrigger', text)

  
  # id is a DOM element or a string containing id or null.
  # Returns DOM element or null.
  r.getElem = (id) ->
    return document.getElementById(id)  if typeof (id) is "string"
    id

  two_line = /\n\n/g
  one_line = /\n/g
  r.linebreak = (s) ->
    s.replace(two_line, "<p></p>").replace one_line, "<br>"

  first_char = /\S/
  r.capitalize = (s) ->
    s.replace first_char, (m) ->
      m.toUpperCase()


  unless "webkitSpeechRecognition" of window
    r.onState "upgrade"
  else
    r.recognition = new webkitSpeechRecognition()
    r.final_transcript = ""
    r.interim_transcript = ""
    r.onState "ready"
    r.onEnd = null
    r.recognition.onstart = ->
      recognizing = true
      r.onState "active"

    r.recognition.onerror = (event) ->
      if event.error is "no-speech" or event.error is "audio-capture" or event.error is "not-allowed"
        r.onState event.error
        ignore_onend = true

    r.recognition.onend = ->
      recognizing = false
      return  if ignore_onend
      if r.final_transcript is ""
        r.onState "ready"
        return
      r.onState "complete"
      r.onEnd()  unless not r.onEnd

    r.recognition.onresult = (event) ->
      r.interim_transcript = ""
      i = event.resultIndex

      while i < event.results.length
        if event.results[i].isFinal
          r.final_transcript += event.results[i][0].transcript
        else
          r.interim_transcript += event.results[i][0].transcript
        ++i
      r.final_transcript = r.capitalize(r.final_transcript)
      r.setText r.final_results, r.final_transcript
      r.setText r.interim_results, r.interim_transcript
      r.onResult()  unless not r.onResult

# Informational text that is displayed for each status condition.
# {key : display_text, key : display_text, ...}
status_array_en =
  ready: "Click on the microphone icon and begin speaking."
  active: "Speak now."
  "no-speech": "No speech was detected. You may need to adjust your " + "<a href=\"//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892\">" + " microphone settings</a>."
  "audio-capture": "No microphone was found. Ensure that a microphone is installed and that " + "<a href=\"//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892\">" + " microphone settings</a> are configured correctly."
  allow: "Click the \"Allow\" button above to enable your microphone."
  "not-allowed": "Permission to use microphone is denied. To change, go to " + "chrome://settings/contentExceptions#media-stream"
  upgrade: "Web Speech API is not supported by this browser.  Upgrade to " + "<a href=\"//www.google.com/chrome\">Chrome</a>."


# Button images for various status conditions.
image_array_mic =
  ready: "mic.gif"
  complete: "mic.gif"
  active: "mic-animate.gif"
  "no-speech": "mic.gif"
  disable: "mic-slash.gif"