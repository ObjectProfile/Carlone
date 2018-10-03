public
grid
	| b l |
	b := [ :elements | 
		| height width |
		(elements size < 3 
			ifTrue: [ (elements size max: 1) @ 1 ]
			ifFalse: [ 
				height := (elements size * 0.618034) sqrt ceiling truncated.
				width := (elements size / height) ceiling truncated.
				width @ height ]) x ].
	l := BlGridLayout new.
	l columnCount: (b value: self root children).
	l cellSpacing: 5.
	self root layout: l