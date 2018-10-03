layout-utils
layoutChildrenOfRow: row
	| oldCanvas|
	oldCanvas := self rectangle veryDeepCopy.
	row do: [ :each | | children |
		children := each userData at: #children ifAbsent: [ #() ].
		self 
			squarify: children 
			inRectangle: (CARectangleTreeMap fromContainerBounds: (each measuredBounds position extent: each extent) withInset: self inset) ].
	
	self rectangle: oldCanvas.