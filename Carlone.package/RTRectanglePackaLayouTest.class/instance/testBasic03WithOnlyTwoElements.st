tests
testBasic03WithOnlyTwoElements

	| v es |
	v := RTView new.
	es := RTBox new size: [ :n | n * 10 ]; elementsOn: (1 to: 2).
	RTRectanglePackLayout on: es.
	v addAll: es.
	self assert: (es collect: #position) asArray equals: ((Array new: 2) at: 1 put: ((35@5)); at: 2 put: ((10@10)); yourself)