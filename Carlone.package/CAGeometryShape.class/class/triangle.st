instance creation - polygon
triangle
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (BlPolygon generatePointsFitSquare: 3);
		yourself 