"
I am the basic pie builder, check my examples.

About me 
* My shape is an ""arc""... not really my shape is an instance of ""BlGeometryBuilder arc""
* the default background color of each arc is random 
* I use a layout to set the arcs position 
* I also have a label to create labels around my arcs

.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=
| b classes |
classes := { Array. String. Dictionary. Set }.
b := CAPieBuilder new.
b objects: classes.
b slice: #numberOfMethods.
b build.
^ b
.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=
"
Class {
	#name : #CAPieBuilder,
	#superclass : #CABuilder,
	#instVars : [
		'objects',
		'values',
		'sum',
		'elements',
		'textElements',
		'postCreation',
		'gap',
		'label',
		'start'
	],
	#category : #'Carlone-Builder-Pie'
}

{ #category : #private }
CAPieBuilder >> alphaAngleFor: element [
	| i |
	i := element userData at: #index.
	i isZero ifTrue: [ ^ 0 ].
	^ (values at: i) / sum * 360
]

{ #category : #'public - pies' }
CAPieBuilder >> arcRadiusAuto [
	shape 
		onElement;
		cornerRadius: [ :el | | i e |
			e := (shape executeCommand: #externalRadius:) first.
			i := (shape executeCommand: #innerRadius:) first.
			((i * i) + (e * e)) sqrt ].
]

{ #category : #private }
CAPieBuilder >> betaAngleFor: e [
	values ifNil: [ self slice: #yourself ].
	^ ((values copyFrom: 1 to: (e caIndex) - 1), (Array with: 0)) sum * 360.0 / sum
]

{ #category : #accessing }
CAPieBuilder >> centerGap [
	^ gap
]

{ #category : #accessing }
CAPieBuilder >> centerGap: aPoint [
	gap := aPoint
]

{ #category : #protected }
CAPieBuilder >> elementOn: obj [
	"use elementsOn only"
	self shouldNotImplement 
]

{ #category : #accessing }
CAPieBuilder >> elements [
	^ elements
]

{ #category : #'public - pies' }
CAPieBuilder >> emphasize: object by: anIntegerOrASymbolOrABlock [
	postCreation ifNil: [ postCreation := OrderedCollection new ].
	postCreation add: [ | element geometry delta v |
		element := elements elementFromModel: object.
		geometry := element geometry.
	
		v := (anIntegerOrASymbolOrABlock caValue: object).
		delta := ((v @ 0)) 
				rotateBy: ((geometry betaAngle - geometry alphaAngle) / 2 
					+ geometry alphaAngle) * 3.1415 / 180
				about: 0@0.
		element userData at: #emphasize put: delta
	].
]

{ #category : #initialization }
CAPieBuilder >> initialize [
	super initialize.
	self centerGap: 0@0; start: 0.
	shape := CAGeometryBuilder arc
		onElement;
		innerRadius: 0;
		externalRadius: 100;
		background: [ Color random ];
		alphaAngle: [:e | self innerAngleFor: e ];
		betaAngle: [ :e | self outerAngleFor: e ];
		onModel.
	
]

{ #category : #private }
CAPieBuilder >> innerAngleFor: e [
	^ ((self betaAngleFor: e) + self start) asFloat
]

{ #category : #'public - labels' }
CAPieBuilder >> label [
	^ label ifNil: [ 
		label := CAPieLabelShape label
			builder: self;
			yourself ]
]

{ #category : #rendering }
CAPieBuilder >> layoutArcs: aRootElement [
	| max delta |
	"layout process"
	elements do: #computeLayout.
	max := elements first measuredExtent.
	elements do: [ :e | max := max max: e measuredExtent ].
	delta := 0@0.
	elements do: [ :e | | p |
		p := ( (max - e measuredExtent) /2) + (e userData at: #emphasize ifAbsent: [ 0 ]).
		delta := delta min: p.
		e relocate: p ].
	delta := delta - self centerGap.
	elements do: [ :e |
		e relocate: e measuredBounds position - delta ].
]

{ #category : #'public - pies' }
CAPieBuilder >> objects [
	^objects
]

{ #category : #'public - pies' }
CAPieBuilder >> objects: someObjects [
	objects := someObjects
]

{ #category : #private }
CAPieBuilder >> outerAngleFor: e [
	^ ((self alphaAngleFor: e) + (self betaAngleFor: e) + self start) asFloat
]

{ #category : #rendering }
CAPieBuilder >> renderArcs: aRootElement [
	
	elements := self elementsOn: objects.
	postCreation ifNotNil: [ postCreation do: #value ].
	aRootElement addChildren: elements.
]

{ #category : #rendering }
CAPieBuilder >> renderIn: aRootElement [
	self 
		renderArcs: aRootElement;
		layoutArcs: aRootElement;
		renderLabels: aRootElement.
	
]

{ #category : #rendering }
CAPieBuilder >> renderLabels: aRootElement [
	label ifNil: [ ^ self ].
	textElements := label build.
	aRootElement addChildren: textElements.
]

{ #category : #'public - pies' }
CAPieBuilder >> slice: aBlockOrASymbol [
	values := objects collect: aBlockOrASymbol.
	sum := values sum.
	
]

{ #category : #accessing }
CAPieBuilder >> start [
	^ start
]

{ #category : #accessing }
CAPieBuilder >> start: aNumber [
	start := aNumber
]

{ #category : #accessing }
CAPieBuilder >> totalSum [
	^ sum
]
