accessing
popupText: anObject
	| i |
	self addExclusiveInteraction: (i := CAPopup new).
	i label text: anObject.
	^ i.