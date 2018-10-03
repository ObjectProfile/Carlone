public - layout
grid
	self layoutClass: BlGridLayout.
	
	self columnCount: [ :e | | height width elements |
		elements := e children.
		(elements size < 3 
			ifTrue: [ (elements size max: 1) @ 1 ]
			ifFalse: [ 
				height := (elements size * 0.618034) sqrt ceiling truncated.
				width := (elements size / height) ceiling truncated.
				width @ height ]) x ].
	self cellSpacing: 1.