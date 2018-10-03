tests
testFromObjectsToElements
	| edges |
	b root: view.
	edges := 
		b fromObjects: #(1 2);
			toElements: (elements copyFrom: 10 to: 10);
			connectTo: 10.
	self assert: edges size equals: 2.