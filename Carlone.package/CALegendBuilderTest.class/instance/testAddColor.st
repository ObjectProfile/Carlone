tests
testAddColor

	| lb backElement elements |
	lb := CALegendBuilder new.
	lb addColor: Color black text: 'Method well tested'.
	lb build.

	self assert: lb root children size equals: 1.
	
	backElement := lb root children first.
	self assert: backElement children size equals: 1.

	elements := 	backElement children first children.
	self assert: elements size equals: 2.