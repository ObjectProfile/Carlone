instance creation - polygon
heptagon
	^ self new
		geometryClass: BlPolygon;
		vertices: (BlPolygon generatePointsFitSquare: 7);
		yourself 