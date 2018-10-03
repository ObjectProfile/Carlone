tests
testObjects03
	b root: view.
	b objects: #odd.
	self assert: (b fromElements collect: #caModel) asArray equals: #(1 3 5 7 9)

"	view := RTView new.
	elements := RTBox elementsOn: (1 to: 10).
	view addAll: elements. 
	b := RTEdgeBuilder new."