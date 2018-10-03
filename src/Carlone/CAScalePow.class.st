"
I scale using pow function
"
Class {
	#name : #CAScalePow,
	#superclass : #CAScaleLinear,
	#instVars : [
		'linear',
		'exponent',
		'powp',
		'powb'
	],
	#category : #'Carlone-Scales'
}

{ #category : #accessing }
CAScalePow >> clamp: x [
	linear clamp: x
]

{ #category : #accessing }
CAScalePow >> domain: x [
	linear domain: ((domain := x) collect: [ :i | powp scale: i ]).
]

{ #category : #accessing }
CAScalePow >> exponent [
	^ exponent
]

{ #category : #accessing }
CAScalePow >> exponent: x [
	exponent := x.
	powp exponent: exponent.
	powb exponent: 1/exponent.
	linear domain: (domain collect: [ :i | powp scale: i ])
]

{ #category : #initialization }
CAScalePow >> initialize [
	super initialize.
	linear := self class linear.
	exponent := 1.
	domain := #(0 1).
	powp := CAScalePowPow exponent: exponent.
	powb := CAScalePowPow exponent: 1 / exponent.
]

{ #category : #accessing }
CAScalePow >> interpolate [
	^ linear interpolate
]

{ #category : #accessing }
CAScalePow >> interpolate: x [
	linear interpolate: x
]

{ #category : #transformations }
CAScalePow >> invert: x [
	^ powb scale: (linear invert: x)
]

{ #category : #accessing }
CAScalePow >> range [
	^ linear range
]

{ #category : #accessing }
CAScalePow >> range: x [
	linear range: x
]

{ #category : #hooks }
CAScalePow >> rescale [
]

{ #category : #transformations }
CAScalePow >> scale: x [
	^ linear scale: (powp scale: x)
]
