accessing
interaction
	^ interaction ifNil: [
		interaction := CAInteractionBuilder new.
		self addAction: (CAAction new
			action: [ :el | interaction setUpElement: el ]).
		interaction ].