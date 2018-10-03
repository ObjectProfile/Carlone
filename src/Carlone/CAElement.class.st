"
An Utility method  to build elements without a real element
"
Class {
	#name : #CAElement,
	#superclass : #CAObject,
	#instVars : [
		'caModel',
		'caIndex'
	],
	#category : #'Carlone-Core-OLD-TODELETE'
}

{ #category : #accessing }
CAElement >> caIndex [
	^ caIndex
]

{ #category : #accessing }
CAElement >> caIndex: index [
	caIndex := index
]

{ #category : #accessing }
CAElement >> caModel [
	^ caModel 
]

{ #category : #accessing }
CAElement >> caModel: obj [
	caModel := obj
]
