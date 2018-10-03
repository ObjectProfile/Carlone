"
I describe a command for CAAbstractModelBuilder

My main mission is

* have an accessor to the message, in the DNU of CAAbstractModelBuilder
* execute this message with a lot of elements
* difference when apply this command to the main element or its inner component 'target'
* difference when apply the argument to its model or its element 'argumentTarget'
"
Class {
	#name : #CACommand,
	#superclass : #CAObject,
	#instVars : [
		'message',
		'element',
		'component',
		'isForModel'
	],
	#category : #'Carlone-Core2'
}

{ #category : #'accessing - computed' }
CACommand >> argumentTarget [
	^ self isForModel
		ifTrue: [ element caModel ]
		ifFalse: [ element ]
]

{ #category : #'accessing - computed' }
CACommand >> arguments [
	| args target |
	args := Array new: message arguments size.
	target := self argumentTarget.
	message arguments doWithIndex: [ :arg :index |
		args at: index put: (arg caValue: target) ].
	^ args
]

{ #category : #accessing }
CACommand >> component [
	^ component
]

{ #category : #accessing }
CACommand >> component: anObject [
	component := anObject
]

{ #category : #accessing }
CACommand >> element [
	^ element
]

{ #category : #accessing }
CACommand >> element: anElement [
	element := anElement
]

{ #category : #accessing }
CACommand >> execute [
	| target arguments |
	target := self target.
	arguments := self arguments.
	target perform: self message selector withArguments: arguments.
	^ arguments.
]

{ #category : #testing }
CACommand >> isCondition [ 
	^ false
]

{ #category : #accessing }
CACommand >> isForModel [
	^  isForModel
]

{ #category : #accessing }
CACommand >> isForModel: bool [
	isForModel := bool
]

{ #category : #accessing }
CACommand >> message [
	^ message
]

{ #category : #accessing }
CACommand >> message: aMessage [
	message := aMessage
]

{ #category : #printing }
CACommand >> printOn: stream [
	self message printOn: stream
]

{ #category : #dependencies }
CACommand >> release [ 
	super release.
	element := component := message := nil
]

{ #category : #accessing }
CACommand >> selector [
	^ message selector
]

{ #category : #'accessing - computed' }
CACommand >> target [
	^ (element class canUnderstand: message selector) 
		ifTrue: [ element ]
		ifFalse: [ component ]
]
