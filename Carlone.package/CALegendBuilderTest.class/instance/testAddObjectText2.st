tests
testAddObjectText2

	| lb backElement |
	lb := CALegendBuilder new.
	lb addObject: 'hello world' text: [ :str | str substrings first ].
	lb addText: 'blah'.
	lb build.

	self assert: lb root children size equals: 1.
	
	backElement := lb root children first.
	self assert: backElement children size equals: 2.
	