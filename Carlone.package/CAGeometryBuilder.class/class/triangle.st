instance creation - polygon
triangle
	^ self new
		geometryClass: BlPolygon;
		vertices: (BlPolygon generatePointsFitSquare: 3);
		yourself 