"
I am the main data for elements with geometry
"
Class {
	#name : #CAGeometryShape,
	#superclass : #CAAbstractModelDescriptor,
	#instVars : [
		'interaction',
		'layout',
		'postCreation'
	],
	#category : #'Carlone-Core-OLD-TODELETE'
}

{ #category : #'instance creation' }
CAGeometryShape class >> arc [
	^ self new
		geometryClass: BlCircleSector;
		yourself 
]

{ #category : #'instance creation' }
CAGeometryShape class >> box [
	^ self rectangle
]

{ #category : #'instance creation' }
CAGeometryShape class >> circle [
	^ self ellipse
]

{ #category : #'instance creation - polygon' }
CAGeometryShape class >> diamond [
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (Array 
			with: 1 @ 2
			with: 2 @ 1
			with: 1 @ 0
			with: 0 @ 1);
		yourself 
]

{ #category : #'instance creation' }
CAGeometryShape class >> ellipse [
	^ self new
		geometryClass: BlEllipse;
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryShape class >> heptagon [
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (BlPolygon generatePointsFitSquare: 7);
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryShape class >> hexagon [
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (BlPolygon generatePointsFitSquare: 6);
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryShape class >> octagon [
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (BlPolygon generatePointsFitSquare: 8);
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryShape class >> pentagon [
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (BlPolygon generatePointsFitSquare: 5);
		yourself 
]

{ #category : #'instance creation' }
CAGeometryShape class >> polygon [
	^ self new
		geometryClass: BlPolygon;
		yourself 
]

{ #category : #'instance creation' }
CAGeometryShape class >> rectangle [
	^ self new
		geometryClass: BlRectangle;
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryShape class >> rhomboid [
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (Array
			with: 0 @ 0
			with: 1.333 @ 0
			with: 2 @ 2
			with: 0.667 @ 2);
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryShape class >> square [
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (BlPolygon generatePointsFitSquare: 4);
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryShape class >> star [
	"Outer radius is 1; inner radius of star is smaller"
	^ self new
		geometryClass: BlStar;
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryShape class >> triangle [
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (BlPolygon generatePointsFitSquare: 3);
		yourself 
]

{ #category : #'instance creation - polygon' }
CAGeometryShape class >> vee [
	^ self new
		geometryClass: BlPolygon;
		verticesElement: (Array
			with: 0 @ 0
			with: 1 @ 0.667
			with: 2 @ 0
			with: 1 @ 2);
		yourself 
]

{ #category : #public }
CAGeometryShape >> elementOn: object index: index [
	| el geometry |
	el := self elementClass new.
	el 
		caModel: object;
		caIndex: index.
	geometry := self geometryClass new.
	self updateElement: el second: geometry.
	el size: geometry extent.
	el geometry: geometry.
	postCreation ifNotNil: [ 
		postCreation do: [ :b | b value: el ] ].
	^ el 
]

{ #category : #public }
CAGeometryShape >> elementsOn: objects forEach: aBloc [
	^ self elementsOn: objects forEachElement: [ :e | aBloc value: e caModel ].
]

{ #category : #public }
CAGeometryShape >> elementsOn: objects forEachElement: aBloc [
	| elements |
	elements := self elementsOn: objects.
	elements do: [ :el | 
		el addChildren: (aBloc value: el).
		layout ifNotNil: [ layout setUpElement: el ] ].
	^ elements
]

{ #category : #accessing }
CAGeometryShape >> geometryClass [
	^ self secondClass
]

{ #category : #accessing }
CAGeometryShape >> geometryClass: aClass [
	self
		secondClass: aClass;
		elementClass: BlElement;
		size: 5;
		background: Color red.
]

{ #category : #initialization }
CAGeometryShape >> initialize [
	super initialize.
	"self size: 5"
]

{ #category : #accessing }
CAGeometryShape >> interaction [
	^interaction ifNil: [
		interaction := CAInteractionBuilder new.
		self postCreationAdd: [ :el | interaction setUpElement: el ].
		interaction ].
]

{ #category : #accessing }
CAGeometryShape >> layout [
	^ layout ifNil: [ 
		layout := CALayoutBuilder new grid.
		self postCreationAdd: [ :el | layout setUpElement: el ].
		layout ].
]

{ #category : #private }
CAGeometryShape >> postCreationAdd: aBlock [
	postCreation ifNil: [ postCreation := OrderedCollection new ].
	postCreation add: aBlock
]

{ #category : #public }
CAGeometryShape >> size: aNumber [

	self
		caWidth: aNumber;
		caHeight: aNumber
	
]

{ #category : #public }
CAGeometryShape >> width: aNumber [
	self caWidth: aNumber
]
