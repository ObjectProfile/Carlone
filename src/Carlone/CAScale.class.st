"
I am a common scale interpolator, just put your entry value and this objects scale and return the value in your domain
"
Class {
	#name : #CAScale,
	#superclass : #CAObject,
	#instVars : [
		'domain',
		'range',
		'interpolate',
		'uninterpolate'
	],
	#classInstVars : [
		'default'
	],
	#category : #'Carlone-Scales'
}

{ #category : #'instance creation' }
CAScale class >> category10 [
	^ self ordinal 
		range: CAColorInterpolator category10;
		yourself
]

{ #category : #'instance creation' }
CAScale class >> category20 [
	^ self ordinal 
		range: CAColorInterpolator category20;
		yourself
]

{ #category : #'instance creation' }
CAScale class >> category20b [
	^ self ordinal 
		range: CAColorInterpolator category20b;
		yourself
]

{ #category : #'instance creation' }
CAScale class >> category20c [
	^ self ordinal 
		range: CAColorInterpolator category20c;
		yourself
]

{ #category : #'instance creation' }
CAScale class >> google20 [
	^ self ordinal 
		range: CAColorInterpolator google20;
		yourself
]

{ #category : #'instance creation' }
CAScale class >> linear [
	^ CAScaleLinear new. 
]

{ #category : #'instance creation' }
CAScale class >> log [
	^ CAScaleLog new
]

{ #category : #'instance creation' }
CAScale class >> ordinal [
	^ CAScaleOrdinal new 
]

{ #category : #'instance creation' }
CAScale class >> paired12 [
	^ self ordinal 
		range: CAColorInterpolator paired12;
		yourself
]

{ #category : #'instance creation' }
CAScale class >> pow [
	^ CAScalePow new
]

{ #category : #'instance creation' }
CAScale class >> sky8 [
	^ self ordinal 
		range: CAColorInterpolator sky8;
		yourself
]

{ #category : #'instance creation' }
CAScale class >> sqrt [
	^ self pow
		exponent: 0.5; 
		yourself
]

{ #category : #transformations }
CAScale >> caValue: obj [
	^ self scale: obj
]

{ #category : #accessing }
CAScale >> domain [
	^ domain
]

{ #category : #accessing }
CAScale >> domain: anObject [
	domain := anObject
]

{ #category : #accessing }
CAScale >> interpolate [
	^ interpolate
]

{ #category : #accessing }
CAScale >> interpolate: anObject [
	interpolate := anObject.
]

{ #category : #transformations }
CAScale >> invert: anObject [
	"This is the inverse of scale"
	self subclassResponsibility.
]

{ #category : #accessing }
CAScale >> range [
	^ range
]

{ #category : #accessing }
CAScale >> range: anObject [
	range := anObject
]

{ #category : #hooks }
CAScale >> rescale [
	self subclassResponsibility
]

{ #category : #transformations }
CAScale >> scale: anObject [
	"do you have your domain, and your range? ok so use this method in one of my subclasses"
	self subclassResponsibility
]

{ #category : #accessing }
CAScale >> uninterpolate [
	^ uninterpolate
]

{ #category : #accessing }
CAScale >> uninterpolate: anObject [
	uninterpolate := anObject
]
