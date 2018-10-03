tests
testBasic

	| v es |
	v := RTView new.
	es := RTBox elementsOn: (1 to: 20).
	v addAll: es.
	RTCellLayout on: es.
	
	self assert: es sixth position x equals: es first position x