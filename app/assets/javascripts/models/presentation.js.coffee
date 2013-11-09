###*
 * Class to represent each presentation
 * contains all the basic information about the presentation and a reference to type
###
class Speech.Presentation extends Backbone.Model
	urlRoot: '/api/presentations'

###*
 * Class to represent specific slide show presentations
###
class Speech.SlidePresentation extends Speech.Presentation

###*
 * Class to represent text only presentations
###
class Speech.TextPresentation extends Speech.Presentation


class Speech.PresentationsCollection extends Backbone.Collection
	model: Speech.Presentation
	url: '/api/presentations'
