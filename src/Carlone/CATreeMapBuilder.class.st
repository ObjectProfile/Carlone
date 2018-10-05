"
I am a basic tree map implementation 
"
Class {
	#name : #CATreeMapBuilder,
	#superclass : #CAAbstractTreeBuilder,
	#instVars : [
		'inset',
		'extent',
		'rectangle'
	],
	#category : #'Carlone-Builder-Treemap'
}

{ #category : #accessing }
CATreeMapBuilder >> extent [
	^ extent
]

{ #category : #accessing }
CATreeMapBuilder >> extent: aPoint [
	extent := aPoint
]

{ #category : #'layout-utils' }
CATreeMapBuilder >> getRemainingSpace [
	^ self rectangle shortestSide
]

{ #category : #layout }
CATreeMapBuilder >> highestAspectRatioFor: row remainingSpace: remainingSpace [
	| sum areas minArea maxArea |
	areas := row collect: [ :e | e userData at: #area ].
	sum := areas sum.
	maxArea := areas max.
	minArea := areas min.
	((remainingSpace <=0) or: [minArea <= 0])
		ifTrue: [ ^ SmallInteger maxVal ]
		ifFalse: [ ^ ((((remainingSpace * remainingSpace) * maxArea) / (sum * sum))  max: ((sum * sum) / (minArea * (remainingSpace * remainingSpace)))) ]
]

{ #category : #initialization }
CATreeMapBuilder >> initialize [
	super initialize.
	shape := CAGeometryBuilder box
		background: Color white;
		border: (BlBorder builder paint: Color black; width: 1; build).
		
	shape interaction popup; draggable.
	inset := 4.
	extent := 500 asPoint.
]

{ #category : #accessing }
CATreeMapBuilder >> inset [
	^ inset
]

{ #category : #accessing }
CATreeMapBuilder >> inset: anObject [
	inset := anObject
]

{ #category : #'layout-utils' }
CATreeMapBuilder >> layoutChildrenOfRow: row [
	| oldCanvas|
	oldCanvas := self rectangle veryDeepCopy.
	row do: [ :each | | children |
		children := each userData at: #children ifAbsent: [ #() ].
		self 
			squarify: children 
			inRectangle: (CARectangleTreeMap fromContainerBounds: (each measuredBounds position extent: each extent) withInset: self inset) ].
	
	self rectangle: oldCanvas.
]

{ #category : #layout }
CATreeMapBuilder >> layoutElements [
	self squarify: self rootNodes
		inRectangle: (CARectangleTreeMap origin: 0@0 extent: self extent).

	
]

{ #category : #'layout-utils' }
CATreeMapBuilder >> layoutHorizontalRow: row [ 

	| container totalWidth areaToLayout height |
	container := self rectangle currentSubrectangle.
	totalWidth := container width.	
	areaToLayout := row inject: 0 into: [ :s :e | s + (e userData at: #area) ].
	height := areaToLayout / totalWidth.
	row do: [ :each | each size: (((each userData at: #area) / height) @ height) ].	
	self translateElementsHorizontally: row in: container.
]

{ #category : #layout }
CATreeMapBuilder >> layoutRow: row [
	| container |
	container := rectangle currentSubrectangle.
	(container width >= container height)
		ifTrue: [ self layoutVerticalRow: row ]
		ifFalse: [ self layoutHorizontalRow: row ].
	self layoutChildrenOfRow: row.
	self prepareNextRectangleAfterRow: row.
]

{ #category : #'layout-utils' }
CATreeMapBuilder >> layoutVerticalRow: row [
	| container totalHeight areaToLayout width |
	container := rectangle currentSubrectangle.
	totalHeight := container height.
	areaToLayout := row inject: 0 into: [ :s :e | s+ (e userData at: #area) ].
	width := areaToLayout /totalHeight.
	row do: [ :each | each size: (width @ ( (each userData at: #area) / width)) ].
	self translateElementsVertically: row in: container.
]

{ #category : #'layout-utils' }
CATreeMapBuilder >> prepareElementsForLayout: elms inRectangle: rec [
	| elementsArea viewArea area |
	elms isEmpty ifTrue: [ ^ elms ].
	elementsArea := elms 
		inject: 0 
		into: [ :s :e | s + (self weightOf: e) ].
	
	viewArea := rec width * rec height.
	elms do: [ :e|
		area := ((viewArea * (self weightOf: e))/elementsArea) asFloat.
		e userData at: #area put: area. ].
	
	^ elms
]

{ #category : #'layout-utils' }
CATreeMapBuilder >> prepareNextRectangleAfterRow: row [
	| nextRect |
	nextRect := self rectangle currentSubrectangle computeRemainingSubrectangleFrom: row.
	self rectangle addSubrectangle: nextRect
]

{ #category : #accessing }
CATreeMapBuilder >> rectangle [
	^ rectangle
]

{ #category : #accessing }
CATreeMapBuilder >> rectangle: anObject [
	rectangle := anObject
]

{ #category : #rendering }
CATreeMapBuilder >> renderIn: aRoot [
	aRoot addChildren: self elements.
	self layoutElements.
]

{ #category : #layout }
CATreeMapBuilder >> squarify: children currentRow: row remainingSpace: remainingSpace [
	| firstElement remainingChildren |
	firstElement := children first.
	(row isEmpty or: [
		| oldRatio newElementRatio |
		oldRatio := self highestAspectRatioFor: row remainingSpace: remainingSpace.
		newElementRatio := self highestAspectRatioFor: (row, (Array with: firstElement)) remainingSpace: remainingSpace.
		oldRatio >= newElementRatio ] ) 
	ifTrue: [ 
		remainingChildren := children allButFirst.
		(remainingChildren isEmpty) ifTrue: [ self layoutRow: (row, (Array with: firstElement)) ]
		ifFalse: [ 
			self 
				squarify: remainingChildren
				currentRow: (row, (Array with: firstElement) )
				remainingSpace: remainingSpace ]
	 ] ifFalse: [ 
		self layoutRow: row.
		self 
			squarify: children
			currentRow: (OrderedCollection new)
			remainingSpace: self getRemainingSpace.
	 ].
	firstElement pushBack
]

{ #category : #layout }
CATreeMapBuilder >> squarify: children inRectangle: aTreeRectangle [

	| elementsToLayout |
	children isEmpty ifTrue: [ ^ self  ].
	self rectangle: aTreeRectangle.
	elementsToLayout := self prepareElementsForLayout: children inRectangle: aTreeRectangle.
	self 
		squarify: elementsToLayout
		currentRow: OrderedCollection new
		remainingSpace: (aTreeRectangle width min: aTreeRectangle height).
]

{ #category : #'layout-utils' }
CATreeMapBuilder >> translateElementsHorizontally: row in: container [

	| currentPoint |
	currentPoint := container origin.
	row do: [ :each |
		each computeLayout.
		each relocate: currentPoint.
		currentPoint := currentPoint translateBy: ((each width) @ 0 ).
	].
]

{ #category : #'layout-utils' }
CATreeMapBuilder >> translateElementsVertically: row in: container [
	| currentPoint |
	currentPoint := container origin.
	row do: [ :each | 
		each computeLayout.
		each relocate: currentPoint.
		currentPoint := currentPoint translateBy: (0@(each height))]
]
