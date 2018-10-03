tests
testSimple6

	CAEdgeBuilder new
		root: view;
		fromObjects: (Array with: 2);
		connectFromAll: (Array with: 2) to: 3.
	self assert: view numberOfEdges equals: 1.
