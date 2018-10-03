tests
testAttachPoint
	| v es edge |
	v := RTView new.
	es := RTBox new size: 10; elementsOn: #(1 2).
	v addAll: es.
	edge := RTLine new color: Color red; edgeFrom: es first to: es second.
	v add: edge.

	RTTreeLayout on: es.

	self assert: edge trachelShape from equals: 10 @ 15.
	self assert: edge trachelShape from ~= es first center.
	
	self assert: edge trachelShape to equals: 10 @ 35.
	self assert: edge trachelShape to ~= es second center.