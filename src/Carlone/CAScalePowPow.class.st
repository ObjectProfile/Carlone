"
I am a utility clas for CAScalePow
"
Class {
	#name : #CAScalePowPow,
	#superclass : #CAObject,
	#instVars : [
		'exponent'
	],
	#category : #'Carlone-Scales'
}

{ #category : #'instance creation' }
CAScalePowPow class >> exponent: exponent [
	^ self new 
		exponent: exponent;
		yourself
]

{ #category : #accessing }
CAScalePowPow >> exponent: aNumber [
	exponent := aNumber
]

{ #category : #transformations }
CAScalePowPow >> scale: x [
	^ x < 0
		ifTrue: [ (x negated raisedTo: exponent) negated ]
		ifFalse: [ x raisedTo: exponent ]
]
