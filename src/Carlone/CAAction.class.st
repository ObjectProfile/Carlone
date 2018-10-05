"
I am used in subclasses of CAAbstractModelBuilder. 
CAAbstractModelBuilder can create objects of anything based on 2 components, element and target.
the element has the model, the real object. target can be another object.

Instances of CAAbstractModelBuilder usually creates this 2 components and then uses accessors to modify the object created. by the commands of CAAbstractModelBuilder. CAAction allows you to modify these objects before and after their creation.
"
Class {
	#name : #CAAction,
	#superclass : #CAObject,
	#instVars : [
		'action',
		'isPreloadAction',
		'element'
	],
	#category : #'Carlone-Core'
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
