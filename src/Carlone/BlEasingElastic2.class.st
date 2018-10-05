"
A new basic interpolation for elasticity.

use elasticity:and: to change the elasticity result

I am very usefull for interpolations for animations in bloc, to add my unique elastic style :D
"
Class {
	#name : #BlEasingElastic2,
	#superclass : #BlEasing,
	#instVars : [
		'p',
		'a',
		's'
	],
	#category : #'Carlone-Bloc'
}

{ #category : #accessing }
BlEasingElastic2 >> elasticity: newA and: newP [
	p := newP
		ifNil: [ 0.45 ]
		ifNotNil: [ newP ].
	s := newA
		ifNil: [ a := 1. p / 4 ]
		ifNotNil: [ a := newA. p / Float pi * 2 * (1 / a) arcSin   ].
]

{ #category : #initialization }
BlEasingElastic2 >> initialize [
	super initialize.
	self elasticity: nil and: nil
]

{ #category : #interpolation }
BlEasingElastic2 >> interpolate: aProgress [
	^ 1 + (a * ((2 raisedTo: -10 * aProgress) * ((aProgress - s) * Float pi * 2 / p) sin) )
	"^ (2 raisedTo: (10 * (aProgress - 1))) * ((20 * Float pi * 1.5 / 3 * aProgress) cos)"
]
