tests
testElementsOn
	| e |
	builder objects: #(1 2 3).
	
	self should: [ e := builder elementOn: 1 ] raise: Error.
	e := builder elementsOn: builder objects.
	self assert: e first geometry class equals: BlCircleSector