tests
testSimple7

	CAEdgeBuilder new
		root: view;
		useAssociation: 1 -> 2;
		useAssociation: 2 -> 3;
		useAssociation: 5 -> 6.

	self assert: view numberOfEdges equals: 3