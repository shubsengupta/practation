Speech.Controller = Speech.Controller or {}

_.extend Speech.Controller,

  load_slideshow: (scope, id) ->
    Pra.presentation = new Speech.Presentation
      id: id

    Pra.presentation.fetch
      success: ->
        Pra.slideshowView = new Speech.SlideshowView
          model: Pra.presentation
          el: document.getElementById 'view'

        Pra.slideshowView.render()

        window.reco = new WebSpeechRecognition()
        window.reco.continuous = true
        window.reco.maxAlternatives = 10
        window.reco.finalResults('final_span');
        window.reco.interimResults('interim_span');
        window.vocal_pointer = 0
        window.waiting_pointer = 0

        last_text = ''
        Backbone.Events.on 'interimTextUpdate', ->
          console.log 'Interim: ' + arguments[0]
        Backbone.Events.on 'finalTextUpdate', ->
          console.log 'Final: ' + arguments[0]

        window.reco.toggleStartStop() 