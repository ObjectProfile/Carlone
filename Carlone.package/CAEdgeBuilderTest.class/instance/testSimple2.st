tests
testSimple2

	CAEdgeBuilder new
		root: view;
		useAssociations: (Array 
									with: 1 -> 2
									with: 2 -> 3
									with: 5 -> 6).
	self assert: view numberOfEdges equals: 3