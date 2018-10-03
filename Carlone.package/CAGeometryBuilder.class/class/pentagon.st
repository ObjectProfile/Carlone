instance creation - polygon
pentagon
	^ self new
		geometryClass: BlPolygon;
		vertices: (BlPolygon generatePointsFitSquare: 5);
		yourself 