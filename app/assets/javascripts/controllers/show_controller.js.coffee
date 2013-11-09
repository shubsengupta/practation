Speech.Controller = Speech.Controller or {}

_.extend Speech.Controller,

  load_show: (scope, id) ->
    presentation = new Speech.Presentation
      id: id
    presentation.fetch()

    scope.presentationView = new Speech.PresentationView
      model: presentation