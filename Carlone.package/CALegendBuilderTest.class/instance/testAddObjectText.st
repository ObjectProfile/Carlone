tests
testAddObjectText

	| lb backElement |
	lb := CALegendBuilder new.
	lb addText: 'hello world'.
	lb build.

	self assert: lb root children size equals: 1.
	
	backElement := lb root children first.
	self assert: backElement children size equals: 1.
	
