"
I follow the linear function
"
Class {
	#name : #CAScaleLinear,
	#superclass : #CAScale,
	#instVars : [
		'clamp',
		'input',
		'output'
	],
	#category : #'Carlone-Scales'
}

{ #category : #accessing }
CAScaleLinear >> clamp: aBool [
	"If clamp is specified, enables or disables clamping accordingly. If clamping is disabled and the scale is passed a value outside the domain, the scale may return a value outside the range through extrapolation. If clamping is enabled, the return value of the scale is always within the scale’s range."
	clamp := aBool.
	self rescale.
]

{ #category : #accessing }
CAScaleLinear >> domain: x [
	super domain: x.
	self rescale.
]

{ #category : #initialization }
CAScaleLinear >> initialize [
	super initialize.
	range := domain := #(0 1).
	clamp := false.
	interpolate := CAInterpolator.
	self rescale.
]

{ #category : #accessing }
CAScaleLinear >> interpolate: x [
	interpolate := x.
	self rescale.
]

{ #category : #transformations }
CAScaleLinear >> invert: y [
	^ input scale: y.
]

{ #category : #accessing }
CAScaleLinear >> range: r [
	super range: r.
	self rescale.
]

{ #category : #accessing }
CAScaleLinear >> rangeRound: x [
	"x is a range"
	self 
		range: x;
		interpolate: CARoundInterpolator.
]

{ #category : #hooks }
CAScaleLinear >> rescale [
	| linear |
	linear := (domain size min: range size ) > 2
		ifTrue: [ CAScalePolylinear ]
		ifFalse: [ CAScaleBilinear ].
	uninterpolate := clamp
		ifTrue: [ CAUninterpolateClamp ]
		ifFalse: [ CAUninterpolateNumber ].
	output := linear new domain: domain; range: range; 
		uninterpolate: uninterpolate; interpolate: interpolate.
	output rescale.
	input := linear new domain: range; range: domain;
		uninterpolate: uninterpolate; interpolate: CAInterpolator.
	input rescale.
]

{ #category : #transformations }
CAScaleLinear >> scale: x [
	^ output scale: x
]
