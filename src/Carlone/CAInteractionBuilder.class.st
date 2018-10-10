"
I a m the interaction builder
"
Class {
	#name : #CAInteractionBuilder,
	#superclass : #CAObject,
	#instVars : [
		'interactions'
	],
	#category : #'Carlone-Interaction'
}

{ #category : #adding }
CAInteractionBuilder >> addExclusiveInteraction: anInteraction [
	"We only keep all the interaction that have a different class"
	interactions := interactions select: [ :i | i class ~~ anInteraction class ].
	self addInteraction: anInteraction
]

{ #category : #adding }
CAInteractionBuilder >> addInteraction: anInteraction [
	interactions add: anInteraction
]

{ #category : #accessing }
CAInteractionBuilder >> draggable [
	| i |
	self addExclusiveInteraction: (i := CADraggable new).
	^ i
	
]

{ #category : #initialization }
CAInteractionBuilder >> initialize [
	super initialize.
	interactions := OrderedCollection new.
]

{ #category : #accessing }
CAInteractionBuilder >> popup [
	^ self popupText: #yourself
]

{ #category : #accessing }
CAInteractionBuilder >> popupText: anObject [
	| i |
	self addExclusiveInteraction: (i := CAPopup new).
	i label text: anObject.
	^ i.
]

{ #category : #initialization }
CAInteractionBuilder >> setUpElement: elementOrGroup [
	"elements is an RTGroup, that contains RTElement or RTEdges"
	
	interactions do: [ :int | elementOrGroup @ int ]
]
