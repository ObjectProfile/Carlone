accessing
interaction
	^interaction ifNil: [
		interaction := CAInteractionBuilder new.
		self postCreationAdd: [ :el | interaction setUpElement: el ].
		interaction ].