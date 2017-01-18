exports.capabilities = {}

var Element = function(context, tag) {
	this._context = context
}

Element.prototype.constructor = Element
Element.prototype.append = function(child) { }
Element.prototype.addClass = function(cls) { }
Element.prototype.setHtml = function(cls) { }
Element.prototype.style = function(name, value) {
	log('style', name, value)
}

exports.init = function(ctx) {
	ctx.element = new Element(ctx, ctx.getTag())
}

exports.createElement = function(ctx, tag) {
	return new Element(ctx, tag)
}

exports.initImage = function(image) {
}

exports.loadImage = function(image) {
	log('loading image from ' + image.source)
}

exports.layoutText = function(text) {
	log('laying out text ' + text)
}
