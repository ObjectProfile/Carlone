running
setUp
	super setUp.
	
	view := CACompose new.
	elements := CAGeometryShape box elementsOn: (1 to: 30).
	view addAll: elements.
	view grid.

	b := CAEdgeBuilder new.