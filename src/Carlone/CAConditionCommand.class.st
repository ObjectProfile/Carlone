Class {
	#name : #CAConditionCommand,
	#superclass : #CACommand,
	#instVars : [
		'condition',
		'builder'
	],
	#category : #'Carlone-Core2'
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
