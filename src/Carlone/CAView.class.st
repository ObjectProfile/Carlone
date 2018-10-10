"
I am too young for this section TODO
"
Class {
	#name : #CAView,
	#superclass : #CAObject,
	#instVars : [
		'root',
		'collection',
		'children',
		'content',
		'scrollable',
		'container',
		'layoutBuilder'
	],
	#category : #'Carlone-Core'
}

{ #category : #examples }
CAView class >> example01 [
	| view shape elements |
	view := CAView new.
	shape := CAGeometryBuilder rectangle
		size: [:m | m linesOfCode sqrt] ;
		addEventHandler: BlPullHandler new. 
	shape interaction
		popupText: #name";
		draggable".
	view layout grid cellSpacing: 10.
	elements := shape elementsOn: Collection withAllSubclasses.
	view addAll: elements.
	view inspect
]

{ #category : #adding }
CAView >> addAll: aCollection [
	self content addChildren: aCollection.
	self content layout: (BlOnceLayout new
		layout: (self layout elementOn: self content) ).
]

{ #category : #accessing }
CAView >> children [
	^ children ifNil: [ #() ]
]

{ #category : #accessing }
CAView >> container [
	^ container 
]

{ #category : #accessing }
CAView >> content [
	^ content
]

{ #category : #inspector }
CAView >> gtInspectorIn: composite [
	<gtInspectorPresentationOrder: -10>
	<gtInspectorTag: #basic>
	^ self container gtInspectorLiveIn: composite
]

{ #category : #initialization }
CAView >> initialize [
	super initialize.
	layoutBuilder := CALayoutBuilder new.
	layoutBuilder grid.
	content := BlElement new.
	content clipChildren: false.
	content constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ].
	
	scrollable := BlPannableElement new.
	scrollable constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	scrollable contentElement: content.
	
	container := BlElement new.
	container constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	container addChild: scrollable.
	container addEventHandler: BlSlideHandler new.
	
]

{ #category : #accessing }
CAView >> layout [
	^ layoutBuilder
]
