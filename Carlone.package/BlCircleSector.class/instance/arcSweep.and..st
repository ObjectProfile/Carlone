utility
arcSweep: p1 and: p2
	^ ((p1 x - p2 x)* p1 y) - ((p1 y - p2 y) * p1 x) > 0
		ifTrue: [ 1 ] 
		ifFalse: [ 0 ]