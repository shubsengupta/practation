class Speech.SlideshowView extends Backbone.View

  render: (eventName) ->
    compiled = _.template( $('#tpl-slideshow-view').html() )
    $(@el).html compiled(@model.toJSON())

    _.each @model.get('slideshows'), ((slideshow) ->
      cont = $('<div />')
      img = $('<img />').attr('src', slideshow.image).attr('width', '70%')
      
      done = $('<div />').addClass('done')
      btext = $('<span />').attr('id','body-text').html(slideshow.text)
      btextc = $('<span />').attr('id','body-text-checked')

      done.append btext
      done.append btextc

      cont.append done

      cont.append img
      $('.images').append(cont)
    ), this


    this