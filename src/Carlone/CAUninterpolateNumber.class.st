"
I uninterpolate a value of x acording to 2 limits, a and b
"
Class {
	#name : #CAUninterpolateNumber,
	#superclass : #CAUninterpolate,
	#category : #'Carlone-Scales'
}

{ #category : #interpolating }
CAUninterpolateNumber >> uninterpolate: x [
	^ (x - a )/b
]
