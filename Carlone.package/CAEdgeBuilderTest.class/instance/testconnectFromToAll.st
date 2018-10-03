tests
testconnectFromToAll

	| es1 es2 edges |
	es1 := CAGeometryShape ellipse elementsOn: #(1 2 3).
	es2 := CAGeometryShape box elementsOn: #(1 2 3).
	edges := CAEdgeBuilder new
					fromElements: es1;
					toElements: es2;
					connectFrom: #yourself toAll: [ :obj | Array with: obj ].
	self assert: edges size equals: 3.
	
	self assert: edges first from equals: es1 first.
	self assert: edges first to equals: es2 first.