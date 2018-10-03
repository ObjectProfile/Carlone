"
A CALayoutBuilderTest is a test class for testing the behavior of CALayoutBuilder
"
Class {
	#name : #CALayoutBuilderTest,
	#superclass : #CATest,
	#category : #'Carlone-Tests'
}

{ #category : #tests }
CALayoutBuilderTest >> testGrid [
	| l layout |
	l := CALayoutBuilder new.
	l grid.
	self 
		assert: l layoutClass equals: BlGridLayout;
		assert: l elementClass equals: CAElement.
		
	"This is too ugly but it is just for testing coverage"
	l grid
		columnCount: [ :e | 
			e caIndex: nil.
			e caIndex isNil ifTrue: [ 1 ] ].
	layout := l elementOn: BlElement new.
	self assert: layout class equals: BlGridLayout.
]

{ #category : #tests }
CALayoutBuilderTest >> testGrid2 [
	| v box elements |
	v := CACompose new.
	box := CAGeometryShape box
		size: [:m | m ];
		background: Color lightGray.
	box interaction popup.
	box layout grid.
	elements := box elementsOn: (10 to: 200 by: 10).
	elements
		forEach: [ :aNumber | 
			CAGeometryShape box
				size: 5;
				background: Color blue;
				elementsOn: (1 to: 5) ].
	v addAll: elements.
	v root @ CADraggable.
	v grid.
	v
]
