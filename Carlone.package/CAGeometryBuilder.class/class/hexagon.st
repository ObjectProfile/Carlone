instance creation - polygon
hexagon
	^ self new
		geometryClass: BlPolygon;
		vertices: (BlPolygon generatePointsFitSquare: 6);
		yourself 