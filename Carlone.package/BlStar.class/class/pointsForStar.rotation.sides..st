polygon - helpers
pointsForStar: innerRadius rotation: rotation sides: sides
	| starPoints outerPoints innerPoints ar |
	self assert: (innerRadius < 1 and: [ innerRadius > 0 ] )
		description: 'Inner radius out of range 0-1'.
	self assert: sides >=3  description: 'Invialid number of sides'.
 
	starPoints := Array new: sides * 2.
	outerPoints := self 
		generateUnitNgonPoints: sides 
		rotation: rotation.
	innerPoints := self
		generateUnitNgonPoints: sides 
		rotation: (Float pi / sides negated)+rotation.
	innerPoints doWithIndex: [ :p :i |
		innerPoints 
			at: i
			put: (p * innerRadius) ].
	starPoints doWithIndex: [ :p :i | 
		ar := i even
			ifTrue: [ outerPoints ]
			ifFalse: [ innerPoints ].
		starPoints at: i put: (ar at: i // 2 + (i % 2)) ].
	starPoints := self fitPolygonToSquare: starPoints.
	starPoints doWithIndex: [ :p :i |
		starPoints at: i put: p+1 ].
	^ starPoints