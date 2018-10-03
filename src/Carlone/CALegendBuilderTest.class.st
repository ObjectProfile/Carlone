Class {
	#name : #CALegendBuilderTest,
	#superclass : #CATest,
	#instVars : [
		'b'
	],
	#category : #'Carlone-Tests'
}

{ #category : #initialization }
CALegendBuilderTest >> setUp [
	super setUp.
	b := CALegendBuilder new.
	b addText: 'Hapao show the coverage on which you have run it'.
	b addText: 'Big box = classes. Green classes are unit tests'.
	b addText: 'Inner box = method'.
	b addText: 'height = number of lines of code of '.
	b addText: 'width = number of methods that call it'.
	b addText: 'edge = static call between methods. Above calls below'.
	b addColor: Color black text: 'Method well tested'.
	b addColor: Color gray text: 'Method tested'.
	b addColor: Color red text: 'Method not tested'.
	b addColorFadingFrom: Color yellow to: Color blue text: 'Hello'.
	b addLineColor: Color blue text: 'Blue line'.
	b build
]

{ #category : #tests }
CALegendBuilderTest >> testAddColor [

	| lb backElement elements |
	lb := CALegendBuilder new.
	lb addColor: Color black text: 'Method well tested'.
	lb build.

	self assert: lb root children size equals: 1.
	
	backElement := lb root children first.
	self assert: backElement children size equals: 1.

	elements := 	backElement children first children.
	self assert: elements size equals: 2.
]

{ #category : #tests }
CALegendBuilderTest >> testAddObjectText [

	| lb backElement |
	lb := CALegendBuilder new.
	lb addText: 'hello world'.
	lb build.

	self assert: lb root children size equals: 1.
	
	backElement := lb root children first.
	self assert: backElement children size equals: 1.
	

]

{ #category : #tests }
CALegendBuilderTest >> testAddObjectText2 [

	| lb backElement |
	lb := CALegendBuilder new.
	lb addObject: 'hello world' text: [ :str | str substrings first ].
	lb addText: 'blah'.
	lb build.

	self assert: lb root children size equals: 1.
	
	backElement := lb root children first.
	self assert: backElement children size equals: 2.
	
]
