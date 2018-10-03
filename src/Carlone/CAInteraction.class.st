"
I am the basic interaction for carlone shapes
"
Class {
	#name : #CAInteraction,
	#superclass : #Object,
	#category : #'Carlone-Interaction'
}

{ #category : #public }
CAInteraction class >> onElement: anElement [
	self new onElement: anElement
]

{ #category : #public }
CAInteraction >> onElement: anElement [

	self subclassResponsibility 
	
]
