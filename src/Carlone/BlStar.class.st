"
I am a subclass of BlPolygon, But with the posibility of create a different stars. i am mutable. this means that you can set my #sides: or #innerRadius: of my start. the inner radius must be a number between 0 and 1.

Also you can see CAGeometryBuilder star to create elements with stars.

check this example it is pretty cool CABasicExamples >> #example03Stars
"
Class {
	#name : #BlStar,
	#superclass : #BlPolygon,
	#instVars : [
		'rotation',
		'innerRadius',
		'sides'
	],
	#category : #'Carlone-Bloc'
}

{ #category : #'polygon - helpers' }
BlStar class >> pointsForStar: innerRadius rotation: rotation sides: sides [
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
]

{ #category : #initialization }
BlStar >> initialize [
	super initialize.
	innerRadius := 0.5 * (3 - 5 sqrt) * 1.57.
	rotation := 0.
	sides := 5.
	extent := 2 asPoint.
	self updateVertices.
]

{ #category : #accessing }
BlStar >> innerRadius [
	^ innerRadius
]

{ #category : #accessing }
BlStar >> innerRadius: aNumber [
	innerRadius := aNumber.
	self updateVertices
]

{ #category : #accessing }
BlStar >> rotation [
	^ rotation
]

{ #category : #accessing }
BlStar >> rotation: aNumber [
	rotation := aNumber.
	self updateVertices
]

{ #category : #accessing }
BlStar >> sides [
	^ sides
]

{ #category : #accessing }
BlStar >> sides: aNumber [
	sides := aNumber.
	self updateVertices
]

{ #category : #updating }
BlStar >> updateVertices [
	vertices := self class 
		pointsForStar: self innerRadius
		rotation: self rotation degreesToRadians
		sides: self sides.
	self geometryExtent: extent
]
