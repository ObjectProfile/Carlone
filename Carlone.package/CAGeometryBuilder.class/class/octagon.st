instance creation - polygon
octagon
	^ self new
		geometryClass: BlPolygon;
		vertices: (BlPolygon generatePointsFitSquare: 8);
		yourself 