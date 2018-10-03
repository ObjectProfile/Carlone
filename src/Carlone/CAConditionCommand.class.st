"
I am a condition command. my use is the next.
-------------------------------
shape := CAGeometryBuilder box
	size: 40;
	if: [ :m | m even ] actions: [ 
		shapes background: Color red ].
	
shape elementsOn: (1 to: 10).
-------------------------------
Subclasses of CAAbstractModelBuilder can use the method #if:actions: 
The previous method creates the CAConditionCommand to create elements based on a condition.

the condition'block can be a block or a symbol, the actions'block can recive or not an argument

-------------------------------
(CAGeometryBuilder box
	size: 40;
	background: Color blue;
	if: #even actions: [ :s|
		s background: Color red ]) elementsOn: (1 to: 10).
-------------------------------

"
Class {
	#name : #CAConditionCommand,
	#superclass : #CACommand,
	#instVars : [
		'condition',
		'builder'
	],
	#category : #'Carlone-Core'
}

{ #category : #accessing }
CAConditionCommand >> builder [
	^ builder 
]

{ #category : #accessing }
CAConditionCommand >> builder: aBuilder [
	builder := aBuilder
]

{ #category : #accessing }
CAConditionCommand >> condition [
	^ condition
]

{ #category : #accessing }
CAConditionCommand >> condition: aBlock [
	condition := aBlock
]

{ #category : #accessing }
CAConditionCommand >> execute [
	| target |
	target := self argumentTarget.
	(self condition caValue: target) ifTrue: [ 
		builder 
			executeDuring: self message
			element: self element
			component: self component ].
]

{ #category : #testing }
CAConditionCommand >> isCondition [ 
	^ true
]

{ #category : #printing }
CAConditionCommand >> printOn: stream [
	stream nextPutAll: 'if: '.
	condition printOn: stream.
	stream nextPutAll: ' actions: '.
	message printOn: stream
]

{ #category : #dependencies }
CAConditionCommand >> release [ 
	super release.
	builder := condition := nil.
]

{ #category : #accessing }
CAConditionCommand >> selector [ 
	^ nil
]
