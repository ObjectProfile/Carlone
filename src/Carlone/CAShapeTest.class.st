"
A CAShapeTest is a test class for testing the behavior of CAShape
"
Class {
	#name : #CAShapeTest,
	#superclass : #CATest,
	#category : #'Carlone-Tests'
}

{ #category : #tests }
CAShapeTest >> testBasic [
	| shape |
	shape := CAGeometryShape arc.
	shape
		backgroundElement:  Color red.
	self assert: shape geometryClass equals: BlCircleSector.
	self assert: (shape globalAttributeAt: #background:) equals: {Color red}.
]

{ #category : #tests }
CAShapeTest >> testBasicBox [
	| shape element geometry |
	shape := CAGeometryShape box.
	shape
		"initializeWith: 2; For corner radius"
		size: 40;
		background: Color lightGray.
		
	self assert: shape geometryClass equals: BlRectangle.
	
	self assert: (shape globalAttributeAt: #background:) class equals: Array.
	
	"shape cornerRadius: 10."
	
	element := shape elementOn: 'foobar'.
	geometry := element geometry.
	element computeLayout.
	
	self assert: element background paint color equals: Color lightGray.
	self assert: geometry extent equals: 40@40.
	"self assert: geometry cornerRadii topLeft equals: 10."

]

{ #category : #tests }
CAShapeTest >> testBasicEllipse [
	| shape element geometry |
	shape := CAGeometryShape ellipse.
	shape
		diameter:  100;
		background: Color lightGray.
		
	self assert: shape geometryClass equals: BlEllipse.
	self assert: (shape globalAttributeAt: #background:) class equals: Array.
	
	element := shape elementOn: 'foobar'.
	geometry := element geometry.
	element computeLayout.
	
	self assert: element background paint color equals: Color lightGray.
	self assert: geometry extent equals: 100@100.

]

{ #category : #tests }
CAShapeTest >> testInitialSize [

	| boxAsBlocElement |
	boxAsBlocElement := CAGeometryShape box element.
	boxAsBlocElement computeLayout.
	self assert: boxAsBlocElement extent equals: 5 @ 5
]

{ #category : #tests }
CAShapeTest >> testInitialSize2 [
	| someElements |
	someElements := CAGeometryShape box elementsOn: #(1 2).
	someElements do: #computeLayout.
	self assert: someElements first extent equals: 5 @ 5.
	self assert: someElements second extent equals: 5 @ 5
]
