*Carlone
generatePointsFitSquare: sides
	| points |
	points := self generateUnitNgonPoints: sides rotation: 0.
	points := self fitPolygonToSquare: points.
	points doWithIndex: [ :p :i |
		points at: i put: p+1 ].
	^ points