class Speech.PresentationView extends Backbone.View
  template: _.template( $('#tpl-presentation-view').html() )

  render: (eventName) ->
    $(@el).html @template(@model.toJSON())
    console.log @model.toJSON()
    this