"
I have the main code for elements.
"
Class {
	#name : #CAAbstractModelDescriptor,
	#superclass : #CAObject,
	#instVars : [
		'elementClass',
		'secondClass',
		'globalAttributes',
		'elementKeys',
		'secondKeys'
	],
	#category : #'Carlone-Core-OLD-TODELETE'
}

{ #category : #private }
CAAbstractModelDescriptor >> clean [
	globalAttributes := elementKeys := secondKeys := nil.
]

{ #category : #'reflective operations' }
CAAbstractModelDescriptor >> doesNotUnderstand: aMessage [
	| args |
	args := Array with: aMessage.
	#(isElementCondition: isModelCondition: isElementSetter: isModelSetter:)
		do: [ :cond | 
			(self perform: cond withArguments: args)
				ifTrue: [ ^ self ] ].
	
	self privateSet: aMessage selector with: aMessage arguments
]

{ #category : #public }
CAAbstractModelDescriptor >> element [
	^ self elementOn: nil
]

{ #category : #accessing }
CAAbstractModelDescriptor >> elementClass [
	^ elementClass
]

{ #category : #accessing }
CAAbstractModelDescriptor >> elementClass: aClass [
	elementClass := aClass

]

{ #category : #public }
CAAbstractModelDescriptor >> elementOn: object [
	^ self elementOn: object index: nil
]

{ #category : #public }
CAAbstractModelDescriptor >> elementOn: object	index: index [
	self subclassResponsibility.
]

{ #category : #public }
CAAbstractModelDescriptor >> elementsOn: aCollectionOfObjects [
	| g |
	g := CAGroup new: aCollectionOfObjects size.
	aCollectionOfObjects doWithIndex: [ :obj :index | 
		g add: (self elementOn: obj index: index) ].
	^ g
	
]

{ #category : #accessing }
CAAbstractModelDescriptor >> globalAttributeAt: key [
	globalAttributes ifNil: [ ^ nil ].
	^ globalAttributes at: key.
]

{ #category : #accessing }
CAAbstractModelDescriptor >> globalAttributes [
	^ globalAttributes ifNil: [ globalAttributes := Dictionary new ].
]

{ #category : #utility }
CAAbstractModelDescriptor >> isElementCondition: aMessage [
	| args sel old |
	aMessage arguments size = 2 ifFalse: [ ^ false ].
	(aMessage selector beginsWith: #if:) ifFalse: [ ^ false ].
	(aMessage selector endsWith: #Element:) ifFalse: [ ^ false ].
	sel := aMessage selector copyFrom: 4 to: aMessage selector size - 8.
	old := self globalAttributeAt: sel, ':'.
	old ifNil: [ self error: 'Use ', sel, ' first'. ^ false. ].
	args := Array
		with: [ :e | 
			(aMessage arguments first caValue: e)
				ifTrue: [ aMessage arguments second caValue: e ]
				ifFalse: [ old first caValue: e ] ].
	self 
		perform: sel, #Element:
		withArguments: args.
	^ true


]

{ #category : #utility }
CAAbstractModelDescriptor >> isElementSetter: aMessage [
	| sel |
	aMessage arguments size = 1 ifFalse: [ ^ false ].
	(aMessage selector endsWith: #Element:) ifFalse: [ ^ false ].
	sel := (aMessage selector allButLast: 8), ':'.
	self privateSet: sel with: aMessage arguments.
	^ true
]

{ #category : #utility }
CAAbstractModelDescriptor >> isModelCondition: aMessage [
	| args |
	aMessage arguments size = 2 ifFalse: [ ^ false ].
	(aMessage selector beginsWith: #if:) ifFalse: [ ^ false ].
	args := Array
		with: [ :e | aMessage arguments first caValue: e caModel ]
		with: [ :e | aMessage arguments second caValue: e caModel ].
	self 
		perform: aMessage selector allButLast, #Element:
		withArguments: args.
	^ true
]

{ #category : #utility }
CAAbstractModelDescriptor >> isModelSetter: aMessage [
	aMessage arguments size = 1 ifFalse: [ ^ false ].
	self 
		perform: aMessage selector allButLast, #Element:
		withArguments: (Array with: [:el | aMessage arguments first caValue: el caModel ] ).
	^ true
]

{ #category : #private }
CAAbstractModelDescriptor >> privateSet: selector with: arg [
	| sel |
	sel := selector asSymbol.
	(self elementClass canUnderstand: sel) 
		ifTrue: [
			elementKeys ifNil: [ elementKeys := OrderedCollection new ].
			elementKeys add: sel ]
		ifFalse: [
			secondKeys ifNil: [ secondKeys := OrderedCollection new ].
			secondKeys add: sel ].
	self globalAttributes at: sel put: arg.
	


]

{ #category : #accessing }
CAAbstractModelDescriptor >> secondClass [
	^ secondClass
]

{ #category : #accessing }
CAAbstractModelDescriptor >> secondClass: aClass [
	secondClass := aClass
]

{ #category : #private }
CAAbstractModelDescriptor >> update: object keys: keys element: element [
	keys ifNil: [ ^ self ].
	keys do: [ :k | | args res |
		
		args := globalAttributes at: k.
		res := Array new: args size.
		args doWithIndex: [ :arg :in | 
			res at: in put: (arg caValue: element).
			 ].
		object perform: k withArguments: res.
		 ].
]

{ #category : #private }
CAAbstractModelDescriptor >> updateElement: element second: geometry [
	
	self 
		update: element 
		keys: elementKeys
		element: element.
	self
		update: geometry
		keys: secondKeys
		element: element
]
