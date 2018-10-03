"
A CALabelShapeTest is a test class for testing the behavior of CALabelShape
"
Class {
	#name : #CALabelShapeTest,
	#superclass : #CATest,
	#category : #'Carlone-Tests'
}

{ #category : #tests }
CALabelShapeTest >> testBasic [
	| shape element elements |
	shape := CALabelShape label.
	shape text: [ :m | m asString, ' top class' ].
	element := shape elementOn: Object.
	
	self assert: shape elementClass equals: BlTextElement.
	self assert: element text asString equals: 'Object top class'.
	
	shape
		text: 'Invoker';
	 	if: #even text: 'Mirana'.
	elements := shape elementsOn: #(1 2 3).
	self assert: elements first text asString equals: 'Invoker'.
	self assert: elements second text asString equals: 'Mirana'.
	self assert: elements third text asString equals: 'Invoker'.
	
]
