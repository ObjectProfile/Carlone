tests
testSimple

	CAEdgeBuilder new
		root: view;
		useElementAssociations: (Array 
									with: elements first -> elements second
									with: elements second -> elements third).
	self assert: view numberOfEdges equals: 2