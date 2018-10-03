as yet unclassified
invalidRect: aBlBounds from: anElement
	super invalidRect: aBlBounds from: anElement.
	self crash ifFalse: [ self releaseCaches ].
	