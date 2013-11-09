###*
 * Main entry point for the application
 * file runs after models, collections, etc.. have been setup
###

class Speech.Delegator extends Backbone.Router

	routes:
		'': 'list'
		'presentations/:id': 'show_presentation'
		'slideshow/:id':'show_slideshow'

	list: -> 
		Speech.Controller.load_list(@)

	show_presentation: (id) ->
		Speech.Controller.load_show(@, id)

	show_slideshow: (id) ->
		Speech.Controller.load_slideshow(@, id)


$ ->
	Pra.delegator = new Speech.Delegator()
	Backbone.history.start
		pushState: yes
		hashChange: no
		root: '/dashboard'

	$('nav .navbar-header').on 'click', ->
		Pra.delegator.navigate('/', true)


	