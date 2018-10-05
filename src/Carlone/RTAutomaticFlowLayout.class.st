Class {
	#name : #RTAutomaticFlowLayout,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #'Carlone-Roassal-layouts'
}

{ #category : #'as yet unclassified' }
RTAutomaticFlowLayout >> initialize [
	super initialize.
	elements := #yourself
]

{ #category : #'as yet unclassified' }
RTAutomaticFlowLayout >> initializeElement: view [
	view canvas when: TRResizeCanvasEvent do: [ :evt |
		RTFlowLayout new maxWidth: evt newExtent x; on: (view elements rtValue: elements)
	].
]
