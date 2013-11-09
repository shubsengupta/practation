###*
 * Namespace for the entire javasceript app
 * @type {Object}
###

window.Speech = {}

# Set up some aliases for conveienece
_.extend window,
	S: Speech
	speech: Speech

# using handlebar style template delimiters
_.templateSettings = {
  'interpolate': /{{([\s\S]+?)}}/g
};

