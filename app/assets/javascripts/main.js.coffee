###*
 * Main entry point for the application
 * file runs after models, collections, etc.. have been setup
###

class Speech.Delegator extends Backbone.Router

	routes:
		'': 'list'
		'presentations/:id': 'show'

	list: -> 
		Speech.Controller.load_list(@)

	show: (id) ->
		Speech.Controller.load_show(@, id)




	$.get Speech.Presentation.prototype.urlRoot, (data) ->
		console.log data
		Pra.presentations = new Speech.PresentationsCollection(data)