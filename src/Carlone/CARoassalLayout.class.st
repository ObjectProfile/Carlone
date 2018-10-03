Class {
	#name : #CARoassalLayout,
	#superclass : #BlFitLayout,
	#instVars : [
		'layout'
	],
	#category : #'Carlone-Roassal-layouts'
}

{ #category : #accessing }
CARoassalLayout >> layout [
	^ layout
]

{ #category : #accessing }
CARoassalLayout >> layout: anObject [
	layout := anObject
]

{ #category : #layout }
CARoassalLayout >> layout: anElement in: aRectangle [

	super layout: anElement in: aRectangle.

	anElement managedChildrenDo: [ :child |
		child applyLayoutIn: child measuredBounds asRectangle ].
	
	layout on: (Array withAll: anElement children).
]

{ #category : #layout }
CARoassalLayout >> measurePositions: anElement with: anExtentSpec [
	layout on: (Array withAll: anElement children)
]
