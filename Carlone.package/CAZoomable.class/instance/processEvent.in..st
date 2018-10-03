public
processEvent: evt in: anElement
	| dist matrix scale |
	evt consumed: true.
	matrix := anElement transformation matrix.
	dist := evt position - anElement measuredBounds center.
	scale := matrix sx.	"matrix sy" 
	evt isScrollUp ifTrue: [
		scale * 1.25 <= self maxZoom ifTrue: [ 
			scale := scale * 1.25.
			dist := dist * 0.2 ]
		ifFalse: [ ^ self ] ].
	evt isScrollDown ifTrue: [ 
		scale * 0.8 >= self minZoom ifTrue: [ 
			scale := scale * 0.8.
			dist := dist * -0.25 ]
		ifFalse: [ ^ self ].
	 ].
	anElement transformDo: [ :t | 
		t
			scaleBy: scale";
			translateBy: dist" ]
			