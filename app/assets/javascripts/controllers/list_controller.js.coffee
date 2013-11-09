Speech.Controller = Speech.Controller or {}

_.extend Speech.Controller,

	load_list: ->

		$.get Speech.Presentation.prototype.urlRoot, (data) ->
			Pra.presentations = new Speech.PresentationsCollection(data)

			Pra.listView = new Speech.ListView
				collection: Pra.presentations
				className: 'presentation-item'
				el: document.getElementById('view')

			Pra.listView.render()
