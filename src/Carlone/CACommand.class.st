"
I describe a command for CAAbstractModelBuilder

My main mission is

* have an accessor to the message, in the DNU of CAAbstractModelBuilder
* execute this message with a lot of elements
* difference when apply this command to the main element or its inner component 'target'
* difference when apply the argument to its model or its element 'argumentTarget'

Example: 
| shape |
shape:= CAGeometryBuilder box. ""Now this shape can creates boxes""
shape background: Color red. ""There are not visual elements at this point""
""the previous method does not exist in CAGeometryBuilder or its superclasses""
""this will be execute when someone creates a box with this shape""
""We just set the properties of our future elements""
shape size: [ :model |
	model * 10 ] . ""we can use the model to set the correct property""
shape border: (BlBorder paint: Color black). ""we have one border for all the future boxes""

shape elementsOn: (1 to: 10). ""Now we have boxes""
""#elementsOn: runs with a collection, but you can use #elementOn:, or simple #element"".
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
	#category : #'Carlone-Core'
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
