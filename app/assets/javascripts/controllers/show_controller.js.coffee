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