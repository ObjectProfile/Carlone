tests
testBasic04WithOnlyOneElement

	| v es |
	v := RTView new.
	es := RTBox new size: [ :n | n * 10 ]; elementsOn: (1 to: 1).
	RTRectanglePackLayout on: es.
	v addAll: es.
	self assert: (es collect: #position) asArray equals: ((Array new: 1) at: 1 put: ((5@5)); yourself)