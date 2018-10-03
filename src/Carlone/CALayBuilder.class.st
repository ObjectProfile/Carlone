Class {
	#name : #CALayBuilder,
	#superclass : #Object,
	#instVars : [
		'layoutImplementation'
	],
	#category : #'Carlone-Builder-LayoutBuilder'
}

{ #category : #examples }
CALayBuilder >> grid [
	layoutImplementation := RTGridLayout new.
]

{ #category : #initialization }
CALayBuilder >> setUpContainer: elementAsContainer [
	elementAsContainer layout: (CARoassalLayout new layout: layoutImplementation)
]

{ #category : #examples }
CALayBuilder >> sugiyama [
	layoutImplementation := RTSugiyamaLayout new.
]

{ #category : #examples }
CALayBuilder >> tree [
	layoutImplementation := RTTreeLayout new.
]
