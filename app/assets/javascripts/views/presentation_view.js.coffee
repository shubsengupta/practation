class Speech.PresentationView extends Backbone.View

  render: (eventName) ->
    compiled = _.template( $('#tpl-presentation-view').html() )
    $(@el).html compiled(@model.toJSON())
    console.log @model
    console.log @model.attributes
    this