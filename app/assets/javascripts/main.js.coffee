###*
 * Main entry point for the application
 * file runs after models, collections, etc.. have been setup
###

class Speech.Delegator extends Backbone.Router

	routes:
		'': 'list'
		'presentations/:id': 'show'

	list: -> 
		console.log 'List'
		Speech.Controller.load_list(@)

	show: (id) ->
		console.log 'Show'
		Speech.Controller.load_show(@, id)



$ ->
	Pra.delegator = new Speech.Delegator()
	Backbone.history.start
		pushState: yes
		hashChange: no
		root: '/dashboard'


	