Class {
	#name : #RTNullLayout,
	#superclass : #RTLayout,
	#category : #'Carlone-Roassal-layouts'
}

{ #category : #hook }
RTNullLayout >> doExecute: elements [
	elements do: [ :e | e translateTo: 0 @ 0 ]
]
