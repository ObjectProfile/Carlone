transformations
scale: x
	^ x < 0
		ifTrue: [ (x negated raisedTo: exponent) negated ]
		ifFalse: [ x raisedTo: exponent ]