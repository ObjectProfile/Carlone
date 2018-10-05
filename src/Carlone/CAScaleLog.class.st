"
for scale log
"
Class {
	#name : #CAScaleLog,
	#superclass : #CAScaleLinear,
	#instVars : [
		'linear',
		'base',
		'positive'
	],
	#category : #'Carlone-Scales'
}

{ #category : #accessing }
CAScaleLog >> base [
	^ base
]

{ #category : #accessing }
CAScaleLog >> base: number [
	base := number.
	linear domain: (domain collect: [:n | self lg: n ]).
]

{ #category : #accessing }
CAScaleLog >> clamp: x [
	 linear clamp: x
]

{ #category : #accessing }
CAScaleLog >> domain: arr [
	positive := arr first >= 0.
	domain := arr.
	linear domain: (arr collect: [:n | self lg: n]).
]

{ #category : #initialization }
CAScaleLog >> initialize [
	super initialize.
	linear := self class linear.
	base := 10.
	positive := true.
	domain := #(1 0).
]

{ #category : #accessing }
CAScaleLog >> interpolate [
	^ linear interpolate
]

{ #category : #accessing }
CAScaleLog >> interpolate: x [
	linear interpolate: x
]

{ #category : #transformations }
CAScaleLog >> invert: x [
	^ self pow: (linear invert: x).
]

{ #category : #'math functions' }
CAScaleLog >> lg: x [
	"logarithm"
	^ (positive 
		ifTrue: [ (x max: 0) ln ]
		ifFalse: [ (x > 0 ifTrue: [ 0 ] ifFalse: [ 0 - x ] ) ln negated ])
		/ (base ln).
		
]

{ #category : #'math functions' }
CAScaleLog >> pow: x [
	^ positive  
		ifTrue: [ base raisedTo: x ]
		ifFalse: [ (base raisedTo: x negated) negated ].
		
]

{ #category : #accessing }
CAScaleLog >> range [
	^ linear range
]

{ #category : #accessing }
CAScaleLog >> range: x [
	linear range: x
]

{ #category : #transformations }
CAScaleLog >> scale: x [
	^ linear scale: (self lg: x)
]
