Class {
	#name : #RTMockEdge,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : #'Carlone-Roassal-layouts'
}

{ #category : #accessing }
RTMockEdge >> from [
	^ from
]

{ #category : #accessing }
RTMockEdge >> from: aMockElement [
	from := aMockElement
]

{ #category : #accessing }
RTMockEdge >> to [
	^ to
]

{ #category : #accessing }
RTMockEdge >> to: aMockElement [
	to := aMockElement
]
