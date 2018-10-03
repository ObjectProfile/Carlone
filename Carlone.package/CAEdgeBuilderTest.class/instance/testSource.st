tests
testSource

	| v es eb c |
	v := CACompose new.
	es := CAGeometryShape box elementsOn: #(1 2 3). 
	v addAll: es.
	
	eb := CAEdgeBuilder new.
	eb root: v.
	
	c := OrderedCollection new.
	c add: 1 -> 2.
	c add: 3 -> 1.
	eb source: c connectFrom: #key to: #value.
	
	self assert: v numberOfEdges equals: 2