"
I am a utility class to hepl th layout process in CATreeMapBuilder
"
Class {
	#name : #CARectangleTreeMap,
	#superclass : #Rectangle,
	#instVars : [
		'currentSubrectangle',
		'subrectangles',
		'inset'
	],
	#category : #'Carlone-Builder-Treemap'
}

{ #category : #'instance creation' }
CARectangleTreeMap class >> fromContainerBounds: aRectangle withInset: anInteger [
	| treeRectangle relativeOrigin relativeCorner |
	treeRectangle := self new.
	treeRectangle inset: anInteger.
	relativeOrigin := aRectangle origin.
	relativeCorner := aRectangle corner.
	((aRectangle width < (anInteger * 2)) or: [ aRectangle height < (anInteger * 2) ])
		ifTrue: [ treeRectangle origin: relativeOrigin; corner: relativeCorner.]
		ifFalse: [ 
			treeRectangle origin: relativeOrigin +anInteger; 
			corner: relativeCorner - anInteger   ].
	^ treeRectangle 
]

{ #category : #adding }
CARectangleTreeMap >> addSubrectangle: aTreeRectangle [
	self subrectangles add: aTreeRectangle.
	self currentSubrectangle: aTreeRectangle.
]

{ #category : #utils }
CARectangleTreeMap >> computeHorizontalRemainingSubrectangleFrom: row [

	| areaToLayout remainingSubrectangle currentRect currentOrigin |
	
	areaToLayout := row inject: 0 into: [ :s :e | s + (e userData at: #area) ].
	
	remainingSubrectangle := CARectangleTreeMap new.
	
	currentRect := self currentSubrectangle.
	currentOrigin := currentRect origin.
	
	remainingSubrectangle origin: ((currentOrigin x + (areaToLayout / currentRect height)) @ currentOrigin y).
	remainingSubrectangle corner: currentRect corner.
	
	^ remainingSubrectangle.
	 
]

{ #category : #utils }
CARectangleTreeMap >> computeRemainingSubrectangleFrom: row [
	(self currentSubrectangle isHorizontal)
		ifTrue: [^ self computeHorizontalRemainingSubrectangleFrom: row ]
		ifFalse: [ ^ self computeVerticalRemainingSubrectangleFrom: row ]
]

{ #category : #utils }
CARectangleTreeMap >> computeVerticalRemainingSubrectangleFrom: row [

	| areaToLayout remainingSubrectangle currentRect currentOrigin |
	
	areaToLayout := row inject: 0 into: [ :s :e | s + (e userData at: #area) ].
	
	remainingSubrectangle := CARectangleTreeMap new.
	
	currentRect := self currentSubrectangle.
	currentOrigin := currentRect origin.
	
	remainingSubrectangle origin: ((currentOrigin x) @ ((currentOrigin y) + (areaToLayout / currentRect width))).
	remainingSubrectangle corner: currentRect corner.
	
	^ remainingSubrectangle.
	 
]

{ #category : #accessing }
CARectangleTreeMap >> corner: anObject [
	corner := anObject
]

{ #category : #accessing }
CARectangleTreeMap >> currentSubrectangle [
	^ currentSubrectangle ifNil: [ currentSubrectangle := self ]
]

{ #category : #accessing }
CARectangleTreeMap >> currentSubrectangle: anObject [
	currentSubrectangle := anObject
]

{ #category : #initialization }
CARectangleTreeMap >> initialize [
	super initialize.
	inset := 0.
]

{ #category : #accessing }
CARectangleTreeMap >> inset [
	^ inset
]

{ #category : #accessing }
CARectangleTreeMap >> inset: anObject [
	inset := anObject
]

{ #category : #testing }
CARectangleTreeMap >> isHorizontal [

	^ (self width >= self height)
]

{ #category : #accessing }
CARectangleTreeMap >> origin: anObject [
	origin := anObject
]

{ #category : #utils }
CARectangleTreeMap >> shortestSide [

	^ self width min: self height
]

{ #category : #accessing }
CARectangleTreeMap >> subrectangles [
	^ subrectangles ifNil: [subrectangles := OrderedCollection new]
]
