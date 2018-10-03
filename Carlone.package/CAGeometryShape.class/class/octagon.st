instance creation - polygon
octagon
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (BlPolygon generatePointsFitSquare: 8);
		yourself 