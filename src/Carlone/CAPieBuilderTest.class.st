"
A CAPieBuilderTest is a test class for testing the behavior of CAPieBuilder
"
Class {
	#name : #CAPieBuilderTest,
	#superclass : #CATest,
	#instVars : [
		'builder'
	],
	#category : #'Carlone-Tests'
}

{ #category : #initialization }
CAPieBuilderTest >> setUp [
	builder := CAPieBuilder new.
]

{ #category : #tests }
CAPieBuilderTest >> testArcPadding [
	builder objects: (Array with: Dictionary with: Collection with: Set with: OrderedCollection ).
	builder slice: #numberOfMethods.
	builder shape
		segmentSpacing: 1.
	self assert: (builder shape globalAttributeAt: #segmentSpacing:) first class equals: BlockClosure.
	builder build.
]

{ #category : #tests }
CAPieBuilderTest >> testBasic [
	builder objects: (Array with: Dictionary with: Collection with: Set with: OrderedCollection ).
	builder slice: #numberOfMethods.
	builder build.
]

{ #category : #tests }
CAPieBuilderTest >> testElementsOn [
	| e |
	builder objects: #(1 2 3).
	
	self should: [ e := builder elementOn: 1 ] raise: Error.
	e := builder elementsOn: builder objects.
	self assert: e first geometry class equals: BlCircleSector
]

{ #category : #tests }
CAPieBuilderTest >> testEnphasis [
	builder objects: (Array with: Dictionary with: Collection with: Set with: OrderedCollection ).
	builder slice: #numberOfMethods.
	builder emphasize: Set by: 20.
	builder emphasize: Dictionary by: 20.
]

{ #category : #tests }
CAPieBuilderTest >> testInspector [
	builder objects: (Array with: Dictionary with: Collection with: Set with: OrderedCollection ).
	builder slice: #numberOfMethods.
	builder build.
	builder gtInspectorIn: GLMCompositePresentation new.
]

{ #category : #tests }
CAPieBuilderTest >> testLabel [
	| e |
	builder label text: 'hi'.
	e := builder label elementOn: 1.
	self assert: (builder label textFor: e) equals: 'hi'.

]
