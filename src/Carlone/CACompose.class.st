"
I can compose builders
"
Class {
	#name : #CACompose,
	#superclass : #CABuilder,
	#category : #'Carlone-Builder-Compose'
}

{ #category : #public }
CACompose >> addAll: someElements [
	self addChildren: someElements
]

{ #category : #public }
CACompose >> addChild: anElement [
	self root addChild: anElement
]

{ #category : #public }
CACompose >> addChildren: someElements [
	self root addChildren: someElements
]

{ #category : #public }
CACompose >> addVisualization: aVisualization [
	aVisualization build.
	self root addChild: aVisualization root
]

{ #category : #public }
CACompose >> edges [
	"Return the edges"
	^ CAGroup withAll: (self root children select: [ :e | e class == BlLineElement ])
]

{ #category : #accessing }
CACompose >> elements [
	"Return the elements"
	^ CAGroup withAll: (self root children select: [ :e | e class == BlElement ])
]

{ #category : #public }
CACompose >> elementsFromModels: objects [
	| group |
	group := CAGroup new addAll: self root children; yourself.
	^ group elementsFromModels: objects
]

{ #category : #public }
CACompose >> grid [
	| b l |
	b := [ :elements | 
		| height width |
		(elements size < 3 
			ifTrue: [ (elements size max: 1) @ 1 ]
			ifFalse: [ 
				height := (elements size * 0.618034) sqrt ceiling truncated.
				width := (elements size / height) ceiling truncated.
				width @ height ]) x ].
	l := BlGridLayout new.
	l columnCount: (b value: self root children).
	l cellSpacing: 5.
	self root layout: l
]

{ #category : #initialization }
CACompose >> initialize [
	super initialize.
	self initializeDefaultLayout
]

{ #category : #initialization }
CACompose >> initializeDefaultLayout [
	self root layout: (BlGridLayout new
			columnCount: 2;
			cellSpacing: 10).
]

{ #category : #public }
CACompose >> numberOfEdges [
	"Return the number of edges contained in myself"
	^ self edges size
]

{ #category : #public }
CACompose >> objects: someObjects forEach: aBlock [
	someObjects do: [ :anObject | 
		self addVisualization: (aBlock value: anObject) ]
]

{ #category : #public }
CACompose >> treeLayout [

	| l |
	l := RTTreeLayout new. 
	self root layout: (CARoassalLayout new layout: l).
	^ l
]
