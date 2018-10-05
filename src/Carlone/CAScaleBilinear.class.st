"
I represent a bilinear range for 2 limits, start and end
"
Class {
	#name : #CAScaleBilinear,
	#superclass : #CAScale,
	#instVars : [
		'i',
		'u'
	],
	#category : #'Carlone-Scales'
}

{ #category : #hooks }
CAScaleBilinear >> rescale [
	u := uninterpolate uninterpolate: domain first and: domain second.
	i := interpolate interpolate: range first and: range second.
]

{ #category : #transformations }
CAScaleBilinear >> scale: x [
	^ i interpolate: (u uninterpolate: x)
]
