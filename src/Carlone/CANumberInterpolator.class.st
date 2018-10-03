"
I am the basic interpolator for numbers
"
Class {
	#name : #CANumberInterpolator,
	#superclass : #CAInterpolator,
	#category : #'Carlone-Scales'
}

{ #category : #interpolation }
CANumberInterpolator >> interpolate: t [
	^ (start * (1 - t)) + (stop * t).
]
