tests
testBasic02

	| v es |
	v := RTView new.
	es := RTBox new size: [ :n | n * 10 ]; elementsOn: (1 to: 3).
	RTRectanglePackLayout on: es.
	v addAll: es.
	self assert: ((es collect: #position) flatCollect: [:p | Array with: p x with: p y ] as: SortedCollection)  equals: #(31.0 41.0 12.0 46.0 17.0 17.0) asSortedCollection.