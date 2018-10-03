utility
asin: x
	^ x >= 1
	ifTrue: [ 1.5707963267948966 ]
	ifFalse: [ x <= -1
		ifTrue: [ -1.5707963267948966 ]
		ifFalse: [ x arcSin ] ].
	