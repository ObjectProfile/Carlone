Class {
	#name : #CAAction,
	#superclass : #CAObject,
	#instVars : [
		'action',
		'isPreloadAction',
		'element'
	],
	#category : #'Carlone-Core2'
}

{ #category : #accessing }
CAAction >> action [
	^ action
]

{ #category : #accessing }
CAAction >> action: aBlock [
	action := aBlock
]

{ #category : #accessing }
CAAction >> element [
	^ element
]

{ #category : #accessing }
CAAction >> element: anElement [
	element := anElement
]

{ #category : #accessing }
CAAction >> execute [
	self action caValue: self element
]

{ #category : #accessing }
CAAction >> initialize [
	super initialize.
	self postload.
]

{ #category : #accessing }
CAAction >> isPostload [
	^ isPreloadAction not
]

{ #category : #accessing }
CAAction >> isPreload [
	^ isPreloadAction
]

{ #category : #accessing }
CAAction >> postload [
	isPreloadAction := false
]

{ #category : #accessing }
CAAction >> preload [
	isPreloadAction := true
]

{ #category : #dependencies }
CAAction >> release [
	super release.
	action := element :=  nil.
]
