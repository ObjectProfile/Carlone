accessing
layout
	^ layout ifNil: [ 
		layout := CALayoutBuilder new grid.
		self postCreationAdd: [ :el | layout setUpElement: el ].
		layout ].