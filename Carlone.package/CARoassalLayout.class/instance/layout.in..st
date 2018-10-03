layout
layout: anElement in: aRectangle

	super layout: anElement in: aRectangle.

	anElement managedChildrenDo: [ :child |
		child applyLayoutIn: child measuredBounds asRectangle ].
	
	layout on: (Array withAll: anElement children).