"
I am the layout builder, I can create an generate different layouts
"
Class {
	#name : #CALayoutBuilder,
	#superclass : #CAAbstractModelBuilder,
	#category : #'Carlone-Core'
}

{ #category : #public }
CALayoutBuilder >> elementOn: aBlElment index: index [
	| el layout |
	el := self elementClass new.
	el caModel: aBlElment.
	
	layout := self layoutClass new.
	self updateElement: el second: layout.
	
	^ layout
]

{ #category : #'public - layout' }
CALayoutBuilder >> flow [
	self layoutClass: BlFlowLayout.
	
]

{ #category : #'public - layout' }
CALayoutBuilder >> frame [
	self layoutClass: BlFrameLayout.
	
]

{ #category : #'public - layout' }
CALayoutBuilder >> grid [
	self layoutClass: BlGridLayout.
	
	self columnCount: [ :e | | height width elements |
		elements := e children.
		(elements size < 3 
			ifTrue: [ (elements size max: 1) @ 1 ]
			ifFalse: [ 
				height := (elements size * 0.618034) sqrt ceiling truncated.
				width := (elements size / height) ceiling truncated.
				width @ height ]) x ].
	self cellSpacing: 1.
]

{ #category : #accessing }
CALayoutBuilder >> layoutClass [
	^ self secondClass
]

{ #category : #accessing }
CALayoutBuilder >> layoutClass: aClass [
	self
		secondClass: aClass;
		elementClass: CAElement.
	self clean.
]

{ #category : #initialization }
CALayoutBuilder >> setUpElement: element [
	element layout: (self elementOn: element)
]
