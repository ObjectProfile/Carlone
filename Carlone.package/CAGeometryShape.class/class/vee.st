instance creation - polygon
vee
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (Array
			with: 0 @ 0
			with: 1 @ 0.667
			with: 2 @ 0
			with: 1 @ 2);
		yourself 