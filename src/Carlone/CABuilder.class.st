"
I am the base builder
"
Class {
	#name : #CABuilder,
	#superclass : #CAObject,
	#instVars : [
		'rootElement',
		'shape'
	],
	#category : #'Carlone-Core-OLD-TODELETE'
}

{ #category : #public }
CABuilder >> build [
	"Public method that produces the visualization"
	self renderIn: self root.
	^ self root 
]

{ #category : #protected }
CABuilder >> elementOn: object [
	"Create a new element"
	^ self shape elementOn: object
]

{ #category : #protected }
CABuilder >> elementsOn: someObjects [
	"Produce some elements"
	^ self shape elementsOn: someObjects
]

{ #category : #inspector }
CABuilder >> gtInspectorIn: composite [
	<gtInspectorPresentationOrder: -10>
	<gtInspectorTag: #basic>
	^ self root gtInspectorLiveIn: composite
]

{ #category : #initialization }
CABuilder >> initialize [
	super initialize.
	self root: (BlElement new
		background: Color white;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		yourself).
]

{ #category : #hooks }
CABuilder >> renderIn: aRootElement [
	"You need to override this method to make the builder do what you need"
]

{ #category : #accessing }
CABuilder >> root [
	^ rootElement
]

{ #category : #accessing }
CABuilder >> root: element [
	rootElement := element
]

{ #category : #accessing }
CABuilder >> shape [
	^ shape
]

{ #category : #accessing }
CABuilder >> shape: aShape [
	shape := aShape.
]
