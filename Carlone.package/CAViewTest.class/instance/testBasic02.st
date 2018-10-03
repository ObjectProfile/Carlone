tests
testBasic02
	| view shape |
	view := CAView new.
	shape := CAGeometryBuilder box
		background: (Color red alpha: 0.2);
		size: #numberOfMethods.
	view addAll: (shape elementsOn: Collection withAllSubclasses).
	view layout grid.
	view do.
	