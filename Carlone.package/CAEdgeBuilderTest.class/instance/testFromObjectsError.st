tests
testFromObjectsError

"
view := RTView new.
	elements := RTBox elementsOn: (1 to: 10).
	view addAll: elements. 
	b := RTEdgeBuilder new."
	self should: [ CAEdgeBuilder new  fromObjects: #(1 2) ] raise: Error