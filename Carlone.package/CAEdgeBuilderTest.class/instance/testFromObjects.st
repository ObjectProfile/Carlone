tests
testFromObjects
	"
	view := RTView new.
	elements := RTBox elementsOn: (1 to: 10).
	view addAll: elements. 
	b := RTEdgeBuilder new."

	| edges |
	b root: view.
	b fromObjects: #(1 2).
	b connectFrom: #yourself to: 10.
	self assert: view numberOfEdges equals: 2.
	edges := view edges.
	self assert: edges first from caModel equals: 1.
	self assert: edges first to caModel equals: 10.

	self assert: b toObjects asArray equals: (1 to: 10) asArray.
	self assert: b fromObjects asArray equals: #(1 2).