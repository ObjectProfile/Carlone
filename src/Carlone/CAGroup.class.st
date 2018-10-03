"
A CaGroup represents collections of Bloc elements. A CaGroup is not designed to contain other things than Bloc elements. 
A CaGroup is polymorphic to BlElement. When an BlElement  is expected, one can provide an CaGroup.
"
Class {
	#name : #CAGroup,
	#superclass : #OrderedCollection,
	#instVars : [
		'elementFromModelCache'
	],
	#category : #'Carlone-Core-OLD-TODELETE'
}

{ #category : #interaction }
CAGroup >> @ anInteraction [
	self do: [ :element | element @ anInteraction ] 
]

{ #category : #accessing }
CAGroup >> elementFromModel: anObject [
	"Return an element that corresponds to the object provided as parameter. If none is found, then return nil"
	| t key|
	self elementFromModelCache at: anObject ifPresent: [ :v |
		v isCollection ifFalse: [ ^ v ] ].
	"We have this line because of a bug of the implementation of CompiledMethod>>#="
	t := (anObject class == CompiledMethod) 
		ifTrue: [ self detect: [ :el | el caModel == anObject ] ifNone: [ nil ] ]
		ifFalse: [ self detect: [ :el | el caModel = anObject ] ifNone: [ nil ] ].
	"We have this hack for nil objects because in visualWorks a dictionary cannot have nil as a key"
	key := anObject isNil ifTrue: [ 'KeyForNilObjects' ] ifFalse: [ anObject ].
	self elementFromModelCache at: key put: t.
	^ t
]

{ #category : #accessing }
CAGroup >> elementFromModelCache [
	"Define a cache for the element lookup from models"
	elementFromModelCache ifNil: [ elementFromModelCache := Dictionary new ].
	^ elementFromModelCache
]

{ #category : #accessing }
CAGroup >> elementsFromModel: anObject [
	"Return an element that corresponds to the object provided as parameter. If none is found, then return nil"	

	| t key |
	self elementFromModelCache at: anObject ifPresent: [ :v | v isCollection ifTrue: [ ^ v ] ].

	"We have this line because of a bug of the implementation of CompiledMethod>>#="
	t := (anObject class == CompiledMethod) 
				ifTrue: [ self select: [ :el | el caModel == anObject ] ]
				ifFalse: [ self select: [ :el | el caModel = anObject ] ].

	"We have this hack for nil objects because in visualWorks a dictionary cannot have nil as a key"
	key := anObject isNil ifTrue: [ 'KeyForNilObjects' ] ifFalse: [ anObject ].
	self elementFromModelCache at: key put: t.
	^ t
]

{ #category : #accessing }
CAGroup >> elementsFromModels: objects [
	"Return elements that corresponds to the objects provided as parameter. If none is found, then return an empty collection"
	| answer t |
	self assert: [ objects isCollection ] description: 'Provide a set of elements instead of one single element'. 
	answer := CAGroup new.
	objects do: [ :o |
		t := self elementsFromModel: o.
		t notNil ifTrue: [ answer addAll: t ] ].
	^ answer
]

{ #category : #accessing }
CAGroup >> encompassingRectangle [
	^ self 
		ifEmpty: [ (0 @ 0) corner: (0 @ 0) ]
		ifNotEmpty: [ Rectangle merging: (self collect: #encompassingRectangle) ]
]

{ #category : #accessing }
CAGroup >> extent [
	^ self encompassingRectangle extent
]

{ #category : #iterating }
CAGroup >> forEach: aBloc [
	self forEachElement: [ :e | aBloc value: e caModel ].
]

{ #category : #iterating }
CAGroup >> forEachElement: aBloc [
	| children |
	self do: [ :e | 
		children := aBloc value: e.
		e addChildren: children ]
	
]

{ #category : #accessing }
CAGroup >> height [
	^ self extent y
]

{ #category : #accessing }
CAGroup >> relocate: aPosition [

	| center |
	center := self encompassingRectangle center.
	self translateBy: (aPosition - center)
]

{ #category : #accessing }
CAGroup >> translateBy: aPoint [
	self do: [ :e | e translateBy: aPoint ]
]

{ #category : #accessing }
CAGroup >> width [
	^ self extent x
]
