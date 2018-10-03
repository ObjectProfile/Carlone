tests
testConnectToAll
	| eFrom eTo |
	b root: view.
	b objects: #(1 2 3).
	b connectToAll: [ :v | Array with: v - 1 with: v - 2 ].
	
	self assert: view numberOfEdges equals: 3.
	 
	eFrom := (view edges collect: [ :edge | edge from caModel ]) sorted asArray.
	eTo := (view edges collect: [ :edge | edge to caModel ]) sorted asArray.
	self assert: eFrom equals: #(2 3 3).
	self assert: eTo equals: #(1 1 2).