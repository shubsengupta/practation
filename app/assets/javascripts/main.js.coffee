###*
 * Main entry point for the application
 * file runs after models, collections, etc.. have been setup
###

$.get Speech.Presentation.prototype.urlRoot, (data) ->
	console.log data
	Pra.presentations = new Speech.PresentationsCollection(data)
