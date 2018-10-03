instance creation - polygon
hexagon
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (BlPolygon generatePointsFitSquare: 6);
		yourself 