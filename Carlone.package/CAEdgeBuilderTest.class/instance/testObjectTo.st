tests
testObjectTo
	| e |
	b root: view.
	b objects: #(1 2); connectTo: [ :v | v - 1 ].
	
	self assert: view numberOfEdges equals: 1.
	
	e := view edges anyOne.
	self assert: e from caModel equals: 2.
	self assert: e to caModel equals: 1.