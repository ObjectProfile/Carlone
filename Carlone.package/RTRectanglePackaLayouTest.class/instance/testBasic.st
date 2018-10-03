tests
testBasic

	| v es block |
	v := RTView new.
	es := RTBox new size: 5; elementsOn: (1 to: 3).
	RTRectanglePackLayout on: es.
	
	v addAll: es.
	"for vw Set positions are diferent"
	block := [:p | Array with: p x with: p y].
	self assert: ((es collect: #position) flatCollect: block as: SortedCollection) equals:  #(3.0 3.0 3.0 3.0 9.0 9.0) asSortedCollection