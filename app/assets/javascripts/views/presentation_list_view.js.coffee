class Speech.PresentationListView extends Backbone.View

	get: (prop) ->
    @collection.attributes[prop]

	render: ->
		compiled = _.template $('#tpl-presentation-list-view').html()
		$(@el).html(compiled(@collection.toJSON()))
		@