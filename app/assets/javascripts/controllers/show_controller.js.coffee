Speech.Controller = Speech.Controller or {}

_.extend Speech.Controller,

  load_show: (scope, id) ->
    Pra.presentation = new Speech.Presentation
      id: id
    Pra.presentation.fetch
      success: ->
        Pra.presentationView = new Speech.PresentationView
          model: Pra.presentation
          el: document.getElementById 'view'

        Pra.presentationView.render()


        $('#saveText').click (e) ->
          name = $('#input-name').val()
          text = $('#input-speech').val()
          
          Pra.presentation.set('name', name)
          Pra.presentation.set('text', text)
          Pra.presentation.save()
        $('#practText, #reherText').click (e) ->
          if $(this).attr('id') == 'reherText'
            $('.done').addClass('rehearse')

          name = $('#input-name').val()
          text = $('#input-speech').val()

          $('#name-label, #input-speech, .btn').hide()
          $('#name-heading').removeClass('hide').html(name)
          $('#body-text').removeClass('hide').html(text)

          window.reco = new WebSpeechRecognition()
          window.reco.continuous = true
          window.reco.maxAlternatives = 10
          window.reco.finalResults('final_span');
          window.reco.interimResults('interim_span');
          window.vocal_pointer = 0
          window.waiting_pointer = 0

          last_text = ''
          Backbone.Events.on 'interimTextUpdate', ->
            $('span#interim_span').html(arguments[0])

          Backbone.Events.on 'finalTextUpdate', ->
            if last_text != arguments[0]
              $('span#final_span').html(arguments[0])
              last_text = arguments[0]
              setInterval () ->
                window.check()
              , 100
          window.reco.toggleStartStop() 

window.check = () ->
  div_id = 'span#final_span'
  vocal = $(div_id).html().substr(vocal_pointer).toLowerCase()
  waiting = $('#body-text').html().substr(waiting_pointer).toLowerCase()
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
    $('#body-text-checked').html( $('#body-text-checked').html() + "<span style='color:red'>(" + first_word + ") </span>" )
    vocal_pointer += first_space + 1
  else if is_in == 0
    $('#body-text').html( $('#body-text').html().substr(first_space + 1) )
    $('#body-text-checked').html( $('#body-text-checked').html() + "<span style='color:green'>" + first_word + " </span>" )
    vocal_pointer += first_space + 1
  else
    missed = $('#body-text').html().substr(waiting_pointer).substr(0, is_in)
    $('#body-text-checked').html( $('#body-text-checked').html() + "<span style='color:blue'>" + missed + "</span>" )
    $('#body-text').html( $('#body-text').html().substr(missed.length) )

