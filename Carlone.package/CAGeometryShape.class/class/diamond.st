instance creation - polygon
diamond
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (Array 
			with: 1 @ 2
			with: 2 @ 1
			with: 1 @ 0
			with: 0 @ 1);
		yourself 