$ ->
  window.reco = new WebSpeechRecognition()
  reco.continuous = true
  reco.maxAlternatives = 10

  reco.finalResults('final_span');
  reco.interimResults('interim_span');
  last_text = ''

  window.words_hidden = 0
  window.vocal_pointer = 0
  window.waiting_pointer = 0
  Backbone.Events.on 'finalTextUpdate', ->
    if last_text != arguments[0]
      console.log('Final: ' + arguments[0])
      $('span#final_span').html(arguments[0])
      last_text = arguments[0]
      setInterval () ->
        window.check()
      , 100
  Backbone.Events.on 'interimTextUpdate', ->
    $('span#interim_span').html(arguments[0])

  window.wait = true

  $('button#startButton').click (e) ->
    text_map = $('textarea#input').val().trim().replace(/[\.,-\/#!$%\^&\*;:{}=\-_`~()]/g,"").replace(/\s{2,}/g," ")
    $('#unchecked').text(text_map)

    $('textarea#input').hide()
    reco.toggleStartStop() 

  window.check = () ->
    div_id = 'span#final_span'
    vocal = $(div_id).html().substr(vocal_pointer).toLowerCase()
    waiting = $('#unchecked').html().substr(waiting_pointer).toLowerCase()
    first_space = vocal.indexOf(' ')

    first_waiting_space = waiting.indexOf(' ')

    first_word = vocal.substr(0, first_space)

    is_in = waiting.indexOf(first_word)
    if first_space == -1
      if first_waiting_space == -1
        first_word = vocal
        first_space = first_word.length
        if vocal == waiting
          is_in = 0
        else
          is_in = -1
    if is_in == -1
      #$('#checked').html( $('#checked').html() + "<span style='color:red'>" + first_word + "</span>" )
      $('#checked').html( $('#checked').html() + "<span style='color:red'>(" + first_word + ") </span>" )
      #$(div_id).html( $(div_id).html().substr(first_space + 1) )
      vocal_pointer += first_space + 1
      #window.words_hidden += 1
    else if is_in == 0
      $('#unchecked').html( $('#unchecked').html().substr(first_space + 1) )
      #$(div_id).html( $(div_id).html().substr(first_space + 1) )
      $('#checked').html( $('#checked').html() + "<span style='color:green'>" + first_word + " </span>" )
      vocal_pointer += first_space + 1
    else
      missed = $('#unchecked').html().substr(waiting_pointer).substr(0, is_in)
      $('#checked').html( $('#checked').html() + "<span style='color:blue'>" + missed + "</span>" )
      $('#unchecked').html( $('#unchecked').html().substr(missed.length) )
    window.wait = false



