tests
testElements

	| es |
	b := CAEdgeBuilder new.
	b root: view.
	self assert: b fromElements equals: view elements.
	
	es := CAGeometryShape box elementsOn: (1 to: 4).
	b elements: es.
	self assert: b fromElements equals: es.