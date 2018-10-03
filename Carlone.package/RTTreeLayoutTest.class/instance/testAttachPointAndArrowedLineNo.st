tests
testAttachPointAndArrowedLineNo
	| v es edge |
	v := RTView new.
	es := RTBox new size: 10; elementsOn: #(1 2).
	v addAll: es.
	edge := RTArrowedLine new color: Color red; edgeFrom: es first to: es second.
	v add: edge.

	RTTreeLayout new doNotAttachPoint; on: es.

	self assert: edge trachelShape from equals: es first center.
	self assert: edge trachelShape to equals: es second center