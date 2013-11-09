class Speech.ListView extends Backbone.View

  render: (eventName) ->
    @$el.html $('#tpl-list-view').html()

    @collection.each (pres, index) =>

      presView = new Speech.PresentationListView(collection: pres)
      presView.render()
      @$el.find('.target').append presView.$el.html()

      @$el.find('.target tr').last().on 'click', ->

        link = if presView.get('type') is 'TextPresentation'
          "/presentations/#{presView.get('id')}"
        else
          "/slideshow/#{presView.get('id')}"

        Pra.delegator.navigate link, true

    @ 