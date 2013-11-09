class Speech.ListView extends Backbone.View

  render: (eventName) ->
    @$el.html $('#tpl-list-view').html()

    @collection.each (pres, index) =>

      presView = new Speech.PresentationListView(collection: pres)
      presView.render()
      @$el.find('.target').append presView.$el.html()

      link = "/presentations/#{presView.get('id')}"

      @$el.find('.target tr').last().on 'click', ->
        Pra.delegator.navigate link, true

    @ 