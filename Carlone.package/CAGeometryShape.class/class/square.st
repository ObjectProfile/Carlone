instance creation - polygon
square
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (BlPolygon generatePointsFitSquare: 4);
		yourself 