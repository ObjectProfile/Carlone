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

{ #category : #adding }
CAView >> addAll: aCollection [
	self content addChildren: aCollection
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

{ #category : #'undo-undo' }
CAView >> do [ 
	layoutBuilder setUpElement: content
]

{ #category : #initialization }
CAView >> initialize [
	super initialize.
	layoutBuilder := CALayoutBuilder new.
	content := BlElement new.
	content clipChildren: false.
	content 
		layout: (BlOnceLayout new 
			layout: (BlGridLayout new columnCount: 8)).
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
