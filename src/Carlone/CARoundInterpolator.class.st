"
I am a interpolator to round numbers
"
Class {
	#name : #CARoundInterpolator,
	#superclass : #CAInterpolator,
	#category : #'Carlone-Scales'
}

{ #category : #interpolation }
CARoundInterpolator class >> interpolate: a and: b [
	^ self new start: a; stop: b.
]

{ #category : #interpolation }
CARoundInterpolator >> interpolate: t [
	^  (start + (stop * t)) rounded
]

{ #category : #accessing }
CARoundInterpolator >> stop: b [
	stop := b - start
]
