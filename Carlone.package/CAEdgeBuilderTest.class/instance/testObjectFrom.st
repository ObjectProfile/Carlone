tests
testObjectFrom
	| e |
	b root: view.
	b objects: #(1 2); connectFrom: [ :v | v - 1 ].
	
	self assert: view numberOfEdges equals: 1.
	
	e := view edges anyOne.
	self assert: e from caModel equals: 1.
	self assert: e to caModel equals: 2.