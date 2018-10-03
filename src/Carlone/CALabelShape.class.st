"
Like GeometryShape but for labels
"
Class {
	#name : #CALabelShape,
	#superclass : #CAAbstractModelDescriptor,
	#traits : 'TBlTextStyleable',
	#classTraits : 'TBlTextStyleable classTrait',
	#instVars : [
		'textElement',
		'attributes',
		'interaction'
	],
	#category : #'Carlone-Core'
}

{ #category : #'instance creation' }
CALabelShape class >> label [
	^ self new
		labelClass: BlRopedText;
		yourself 
]

{ #category : #accessing }
CALabelShape >> attributesBuilder [
	<return: #BlTextAttributesBuilder>
	
	^ attributes
]

{ #category : #'public - configuration' }
CALabelShape >> color: color [ 
	attributes add: (BrTextForegroundAttribute paint: color)
]

{ #category : #public }
CALabelShape >> elementOn: object index: index [
	| element text |
	
	element :=  self elementClass new.
	element
		caModel: object;
		caIndex: index.
	text := self labelClass string: (self textFor: element) asString.
	element text: text.
	attributes applyOn: text.
	self updateElement: element second: text.
	interaction ifNotNil: [ interaction setUpElement: element ].
	^ element.
	
]

{ #category : #'public - configuration' }
CALabelShape >> fontFamily: aString [
	attributes add: (BrFontFamilyAttribute named: aString)
]

{ #category : #text }
CALabelShape >> if: aBlockOrValue1 text: aBlockOrValue2 [
	self 
		if: [ :e | aBlockOrValue1 caValue: e caModel ] 
		textElement: [ :e | aBlockOrValue2 caValue: e caModel ].
]

{ #category : #text }
CALabelShape >> if: aBlockOrValue1 textElement: aBlockOrValue2 [
	| old |
	old := textElement.
	self textElement: [ :e | (aBlockOrValue1 caValue: e)
		ifTrue: [ aBlockOrValue2 caValue: e ]
		ifFalse: [ old caValue: e ] ]
]

{ #category : #initialization }
CALabelShape >> initialize [
	super initialize.
	self text: #yourself.
	attributes := BlTextAttributesBuilder new.
]

{ #category : #accessing }
CALabelShape >> interaction [
	^ interaction ifNil: [ interaction := CAInteractionBuilder new ].
]

{ #category : #accessing }
CALabelShape >> labelClass [
	^ self secondClass
]

{ #category : #accessing }
CALabelShape >> labelClass: aClass [
	self secondClass: aClass.
	self elementClass: BlTextElement.
]

{ #category : #text }
CALabelShape >> text: aBlockOrValue [
	self textElement: [ :e | aBlockOrValue caValue: e caModel ].
]

{ #category : #text }
CALabelShape >> textElement: aBlockOrValue [
	textElement := aBlockOrValue.
]

{ #category : #text }
CALabelShape >> textFor: object [
	^ textElement caValue: object
]
