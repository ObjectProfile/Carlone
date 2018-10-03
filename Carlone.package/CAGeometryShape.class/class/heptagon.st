instance creation - polygon
heptagon
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (BlPolygon generatePointsFitSquare: 7);
		yourself 