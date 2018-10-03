tests
testFromObjects02
	"
	view := RTView new.
	elements := RTBox elementsOn: (1 to: 10).
	view addAll: elements. 
	b := RTEdgeBuilder new."
	
	b root: view.
	b fromObjects: #(1).
	b connectFrom: #yourself to: 10.
	self assert: view numberOfEdges equals: 1.

	self assert: b toObjects asArray equals: (1 to: 10) asArray.
	self assert: b fromObjects asArray equals: #(1).