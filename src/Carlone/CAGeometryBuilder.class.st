"
I am a class to create BlElements from bloc, with one geometry class.

Use my class methods to create one of my instances 

.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=

| shape blocElements|
shape := CAGeometryBuilder box 
	size: #linesOfCode;
	color: Color red.
	
blocElements := shape elementsOn: Collection withAllSubclasses
.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=
"
Class {
	#name : #CAGeometryBuilder,
	#superclass : #CAAbstractModelBuilder,
	#instVars : [
		'interaction',
		'layout'
	],
	#category : #'Carlone-Core'
}

{ #category : #'instance creation' }
CAGeometryBuilder class >> arc [
	^ self new 
		geometryClass: BlCircleSector;
		yourself.
]

{ #category : #'instance creation' }
CAGeometryBuilder class >> box [
	^ self rectangle
]

{ #category : #'instance creation' }
CAGeometryBuilder class >> circle [
	^ self ellipse
]

{ #category : #'instance creation - polygon' }
CAGeometryBuilder class >> diamond [
	^ self new
		geometryClass: BlPolygon;
		vertices: (Array 
			with: 1 @ 2
			with: 2 @ 1
			with: 1 @ 0
			with: 0 @ 1);
		yourself 
]

{ #category : #'instance creation' }
CAGeometryBuilder class >> ellipse [
	^ self new
		geometryClass: BlEllipse;
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryBuilder class >> heptagon [
	^ self new
		geometryClass: BlPolygon;
		vertices: (BlPolygon generatePointsFitSquare: 7);
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryBuilder class >> hexagon [
	^ self new
		geometryClass: BlPolygon;
		vertices: (BlPolygon generatePointsFitSquare: 6);
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryBuilder class >> octagon [
	^ self new
		geometryClass: BlPolygon;
		vertices: (BlPolygon generatePointsFitSquare: 8);
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryBuilder class >> pentagon [
	^ self new
		geometryClass: BlPolygon;
		vertices: (BlPolygon generatePointsFitSquare: 5);
		yourself 
]

{ #category : #'instance creation' }
CAGeometryBuilder class >> polygon [
	^ self new
		geometryClass: BlPolygon;
		yourself 
]

{ #category : #'instance creation' }
CAGeometryBuilder class >> rectangle [
	^ self new
		geometryClass: BlRectangle;
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryBuilder class >> rhomboid [
	^ self new
		geometryClass: BlPolygon;
		vertices: (Array
			with: 0 @ 0
			with: 1.333 @ 0
			with: 2 @ 2
			with: 0.667 @ 2);
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryBuilder class >> square [
	^ self new
		geometryClass: BlPolygon;
		vertices: (BlPolygon generatePointsFitSquare: 4);
		yourself 
]

{ #category : #'instance creation' }
CAGeometryBuilder class >> star [
	"Outer radius is 1; inner radius of star is smaller"
	^ self new
		geometryClass: BlStar;
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryBuilder class >> triangle [
	^ self new
		geometryClass: BlPolygon;
		vertices: (BlPolygon generatePointsFitSquare: 3);
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryBuilder class >> vee [
	^ self new
		geometryClass: BlPolygon;
		vertices: (Array
			with: 0 @ 0
			with: 1 @ 0.667
			with: 2 @ 0
			with: 1 @ 2);
		yourself 
]

{ #category : #accessing }
CAGeometryBuilder >> elementOn: object index: index [
	| el geometry |
	el := self elementClass new.
	el
		caModel: object;
		caIndex: index.
	self executeActions: #isPreload on: el.
	geometry := self geometryClass new.
	self updateElement: el innerComponent: geometry.
	el
		size: geometry extent;
		geometry: geometry.
	self executeActions: #isPostload on: el.
	^ el
	
]

{ #category : #'public - accessing' }
CAGeometryBuilder >> elementsOn: objects forEach: aBloc [
	^ self elementsOn: objects forEachElement: [ :e | aBloc value: e caModel ].
]

{ #category : #'public - accessing' }
CAGeometryBuilder >> elementsOn: objects forEachElement: aBloc [
	| elements |
	elements := self elementsOn: objects.
	elements do: [ :el | 
		el addChildren: (aBloc value: el).
		layout ifNotNil: [ layout setUpElement: el ] ].
	^ elements
]

{ #category : #accessing }
CAGeometryBuilder >> geometryClass [
	^ self innerClass
]

{ #category : #accessing }
CAGeometryBuilder >> geometryClass: aClass [
	self
		innerClass: aClass;
		size: 5;
		background: Color gray;
		elementClass: BlElement.
]

{ #category : #'public - accessing' }
CAGeometryBuilder >> height: aNumber [
	self caHeight: aNumber
]

{ #category : #accessing }
CAGeometryBuilder >> interaction [
	^ interaction ifNil: [
		interaction := CAInteractionBuilder new.
		self addAction: (CAAction new
			action: [ :el | interaction setUpElement: el ]).
		interaction ].
]

{ #category : #accessing }
CAGeometryBuilder >> layout [
	^ layout ifNil: [ 
		layout := CALayoutBuilder new grid.
		self addAction: (CAAction new
			postload;
			action: [ :el | interaction setUpElement: el ]).
		layout ].
]

{ #category : #'public - accessing' }
CAGeometryBuilder >> size: aNumber [
	self
		width: aNumber;
		height: aNumber.
]

{ #category : #'public - accessing' }
CAGeometryBuilder >> width: aNumber [
	self caWidth: aNumber
]
