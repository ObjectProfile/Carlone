instance creation - polygon
pentagon
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (BlPolygon generatePointsFitSquare: 5);
		yourself 