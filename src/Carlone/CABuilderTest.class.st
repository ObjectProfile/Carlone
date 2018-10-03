"
A CABuilderTest is a test class for testing the behavior of CABuilder
"
Class {
	#name : #CABuilderTest,
	#superclass : #CATest,
	#category : #'Carlone-Tests'
}

{ #category : #tests }
CABuilderTest >> testBasic [
	| b |
	b := CABuilder new.
	self assert: b shape equals: nil.
	
	self assert: b root class equals: BlElement.
	b shape: CAGeometryShape arc.
	self assert: b shape class equals: CAGeometryShape.
	b build.
]

{ #category : #tests }
CABuilderTest >> testElementOn [
	| b |
	b := CABuilder new.
	b shape: CAGeometryShape arc.
	self assert: (b elementOn: 1) class equals: BlElement.
]
