Class {
	#name : #RTDirectLayoutTranslator,
	#superclass : #RTLayoutTranslator,
	#category : #'Carlone-Roassal-layouts'
}

{ #category : #testing }
RTDirectLayoutTranslator class >> isDefault [
	^ true
]

{ #category : #hook }
RTDirectLayoutTranslator >> translate: element to: newPosition [
	element relocate: newPosition
	
]
