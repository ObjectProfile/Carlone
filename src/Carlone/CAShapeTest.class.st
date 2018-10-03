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
	shape := CAGeometryBuilder arc.
	shape background:  Color red.
	self assert: shape geometryClass equals: BlCircleSector.
	self assert: shape commands last message arguments first equals: Color red.
]

{ #category : #tests }
CAShapeTest >> testBasicBox [
	| shape element geometry |
	shape := CAGeometryBuilder box.
	shape
		"initializeWith: 2; For corner radius"
		size: 40;
		background: Color lightGray.
		
	self assert: shape geometryClass equals: BlRectangle.
	
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
	shape := CAGeometryBuilder ellipse.
	shape
		diameter:  100;
		background: Color lightGray.
		
	self assert: shape geometryClass equals: BlEllipse.
	
	element := shape elementOn: 'foobar'.
	geometry := element geometry.
	element computeLayout.
	
	self assert: element background paint color equals: Color lightGray.
	self assert: geometry extent equals: 100@100.

]

{ #category : #tests }
CAShapeTest >> testInitialSize [

	| boxAsBlocElement |
	boxAsBlocElement := CAGeometryBuilder box element.
	boxAsBlocElement computeLayout.
	self assert: boxAsBlocElement extent equals: 5 @ 5
]

{ #category : #tests }
CAShapeTest >> testInitialSize2 [
	| someElements |
	someElements := CAGeometryBuilder box elementsOn: #(1 2).
	someElements do: #computeLayout.
	self assert: someElements first extent equals: 5 @ 5.
	self assert: someElements second extent equals: 5 @ 5
]
