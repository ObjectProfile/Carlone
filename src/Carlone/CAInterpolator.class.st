"
I determine the correct interpolator for a kind of data
my subclasses 
CAColorInterpolator
RTNumberInterpolator
"
Class {
	#name : #CAInterpolator,
	#superclass : #CAObject,
	#instVars : [
		'start',
		'stop'
	],
	#category : #'Carlone-Scales'
}

{ #category : #interpolation }
CAInterpolator class >> interpolate: a and: b [
	| clazz |
	clazz := self interpolatorFor: b.
	^ clazz new start: a; stop: b.
]

{ #category : #interpolation }
CAInterpolator class >> interpolatorFor: b [
	(b isString or: [ b isColor ]) ifTrue: [ ^ CAColorInterpolator ].
	b isNumber ifTrue: [ ^ CANumberInterpolator ].
	
	self error: 'Invalid value for interpolator'
]

{ #category : #interpolation }
CAInterpolator >> interpolate: anObject [
	self subclassResponsibility
]

{ #category : #accessing }
CAInterpolator >> start: anObject [
	start := anObject
]

{ #category : #accessing }
CAInterpolator >> stop: anObject [
	stop := anObject
]
