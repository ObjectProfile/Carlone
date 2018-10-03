initialization
initialize
	super initialize.
	shape := CAGeometryShape box
		background: Color white;
		border: (BlBorder builder paint: Color black; width: 1; build).
		
	shape interaction popup; draggable.
	inset := 4.
	extent := 500 asPoint.