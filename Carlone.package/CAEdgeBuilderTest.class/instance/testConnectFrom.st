tests
testConnectFrom
	| e |
	b root: view.
	b objects: #(1 2).
	b connectFrom: [ :v | v - 1 ].
	
	self assert: view numberOfEdges equals: 1.
	
	e := view edges anyOne.
	self assert: e from caModel equals: 1.
	self assert: e to caModel equals: 2.
	
	self assert: e from outgoingEdges size equals: 1.
	self assert: e from outgoingEdges anyOne equals: e.
	
	self assert: e to incomingEdges size equals: 1.
	self assert: e to incomingEdges anyOne equals: e.