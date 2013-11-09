class Speech.SlideshowView extends Backbone.View

  render: (eventName) ->
    compiled = _.template( $('#tpl-slideshow-view').html() )
    $(@el).html compiled(@model.toJSON())
    this