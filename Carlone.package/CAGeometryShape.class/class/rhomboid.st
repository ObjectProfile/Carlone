instance creation - polygon
rhomboid
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (Array
			with: 0 @ 0
			with: 1.333 @ 0
			with: 2 @ 2
			with: 0.667 @ 2);
		yourself 