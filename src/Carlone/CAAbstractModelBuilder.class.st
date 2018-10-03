"
I am an abstract class to create builders for carlone using DNU

I can:
* create commands.
* create conditios
* create a basic start for a new subclasses

This class allows you to create a builder of classes with a lot of methods like BlElement, and send blocks or values in their arguments


"
Class {
	#name : #CAAbstractModelBuilder,
	#superclass : #CAObject,
	#instVars : [
		'isForElement',
		'elementClass',
		'innerClass',
		'commands',
		'actions'
	],
	#category : #'Carlone-Core2'
}

{ #category : #actions }
CAAbstractModelBuilder >> actions [
	^ actions ifNil: [ #() ].
]

{ #category : #actions }
CAAbstractModelBuilder >> addAction: action [
	self actions isEmpty 
		ifTrue: [ actions := OrderedCollection new ].
	self actions add: action.
]

{ #category : #accesing }
CAAbstractModelBuilder >> commands [
	^ commands ifNil: [ #() ]
]

{ #category : #accesing }
CAAbstractModelBuilder >> commands: aCollection [
	commands := aCollection 
]

{ #category : #'reflective operations' }
CAAbstractModelBuilder >> doesNotUnderstand: aMessage [
	"magic"
	commands add: (CACommand new 
		message: aMessage;
		isForModel: self isForModel;
		yourself).
]

{ #category : #'public - accessing' }
CAAbstractModelBuilder >> element [
	^ self elementOn: nil
]

{ #category : #accesing }
CAAbstractModelBuilder >> elementClass [
	^ elementClass
]

{ #category : #accesing }
CAAbstractModelBuilder >> elementClass: aClass [
	elementClass := aClass
]

{ #category : #'public - accessing' }
CAAbstractModelBuilder >> elementOn: object [
	^ self elementOn: object index: nil
]

{ #category : #'public - accessing' }
CAAbstractModelBuilder >> elementOn: object index: index [
	self subclassResponsibility
]

{ #category : #'public - accessing' }
CAAbstractModelBuilder >> elementsOn: aCollection [
	| g |
	g := CAGroup new: aCollection size.
	aCollection doWithIndex: [ :obj : index |
		g add: (self elementOn: obj index: index) ].
	^ g
]

{ #category : #actions }
CAAbstractModelBuilder >> executeActions: block on: element [
	self actions do: [ :action |
		action element: element.
		(block caValue: action) 
			ifTrue: [ action execute ] ].
]

{ #category : #'reflective operations' }
CAAbstractModelBuilder >> executeCommand: name [
	
	| res |
	res := nil.
	self commands 
		select: [ :cmd | cmd selector = name ]
		thenDo: [ :cmd | res := cmd execute ].
	^ res
]

{ #category : #'reflective operations' }
CAAbstractModelBuilder >> executeDuring: aBlock element: element component: component [
	| bool cmds |
	cmds := commands.
	bool := isForElement.
	commands := OrderedCollection new.
	aBlock caValue: self.
	self updateElement: element innerComponent: component.
	commands := cmds.
	isForElement := bool.
	
]

{ #category : #'reflective operations' }
CAAbstractModelBuilder >> if: booleanBlock actions: actionsBlock [
	commands add: (CAConditionCommand new 
		message: actionsBlock;
		builder: self;
		condition: booleanBlock;
		isForModel: self isForModel;
		yourself).
]

{ #category : #initialization }
CAAbstractModelBuilder >> initialize [
	super initialize.
	self onModel.
	commands := OrderedCollection new.
]

{ #category : #accesing }
CAAbstractModelBuilder >> innerClass [
	^ innerClass 
]

{ #category : #accesing }
CAAbstractModelBuilder >> innerClass: aClass [
	innerClass := aClass
]

{ #category : #testing }
CAAbstractModelBuilder >> isForElement [
	^ isForElement
]

{ #category : #testing }
CAAbstractModelBuilder >> isForModel [
	^ isForElement not
]

{ #category : #'public - accessing' }
CAAbstractModelBuilder >> onElement [
	isForElement := true
]

{ #category : #'public - accessing' }
CAAbstractModelBuilder >> onModel [
	isForElement := false
]

{ #category : #dependencies }
CAAbstractModelBuilder >> release [ 
	super release.
	self commands do: #release.
	self commands: nil.
	self actions do: #release
]

{ #category : #updating }
CAAbstractModelBuilder >> updateElement: element innerComponent: component [
	| copy |
	copy := self commands copy.
	copy do: [ :command |
		command 
			element: element;
			component: component ].
	copy do: #execute
]
