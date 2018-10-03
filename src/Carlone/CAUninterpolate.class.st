"
I am the basic uninterpolator, my subclasses are

CAUninterpolateClamp
CAUninterpolateNumber
"
Class {
	#name : #CAUninterpolate,
	#superclass : #CAObject,
	#instVars : [
		'a',
		'b'
	],
	#category : #'Carlone-Scales'
}

{ #category : #interpolating }
CAUninterpolate class >> uninterpolate: aNum1 and: aNum2 [
	^ self new uninterpolate: aNum1 and: aNum2.
	
]

{ #category : #interpolating }
CAUninterpolate >> uninterpolate: x [
	self subclassResponsibility.
]

{ #category : #interpolating }
CAUninterpolate >> uninterpolate: aNum1 and: aNum2 [
	a := aNum1.
	b := aNum2.
	a isNumber 
		ifFalse: [ ^ a := b := Float nan. ].
	b  := b - a.
	b isZero 
		ifTrue: [ b := 1 / aNum2 ].
]
