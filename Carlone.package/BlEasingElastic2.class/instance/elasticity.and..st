accessing
elasticity: newA and: newP
	p := newP
		ifNil: [ 0.45 ]
		ifNotNil: [ newP ].
	s := newA
		ifNil: [ a := 1. p / 4 ]
		ifNotNil: [ a := newA. p / Float pi * 2 * (1 / a) arcSin   ].