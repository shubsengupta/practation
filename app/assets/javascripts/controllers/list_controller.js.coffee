Speech.Controller = Speech.Controller or {}

_.extend Speech.Controller,

	load_list: ->

		$.get Speech.Presentation.prototype.urlRoot, (data) ->
			console.log data
			Pra.presentations = new Speech.PresentationsCollection(data)