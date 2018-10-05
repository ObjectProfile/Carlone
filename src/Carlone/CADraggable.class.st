"
Interaction to make an element drag and droppable.

Here is an example:

root := CAGeometryShape box
	matchExtent: 2000 asPoint;
	element.
	
box := CAGeometryShape box
	matchExtent: 20 asPoint;
	background: Color red;
	element.
	
root addChild: box.
box @ CADraggable.

root.
"
Class {
	#name : #CADraggable,
	#superclass : #CAInteraction,
	#category : #'Carlone-Interaction'
}

{ #category : #public }
CADraggable >> onElement: anElement [
	
	| initialPosition |
	"We do this to make sure that elements contined in the arguments are not clipped out"
	anElement clipChildren: false.
	initialPosition := 0.
	anElement 
		addEventHandler: (BlEventHandler
			on: BlDragStartEvent
			do: [ :evt | 
				evt consumed: true.
				initialPosition := evt position - anElement position  ]);
		addEventHandler: (BlEventHandler
			on: BlDragEvent
			do: [ :evt | 
				evt consumed: true.
				anElement relocate: evt position - initialPosition  ])




]
