"
I am an handy class to build legend in a visualization

-=-=-=-=-=-=-=-=
b := RTMondrian new.
b shape rectangle
	width: [ :c | c numberOfVariables * 5 ];
	height: #numberOfMethods.
b nodes: RTShape withAllSubclasses.
b edges connectFrom: #superclass.
b layout tree.
b build.

lb := RTLegendBuilder new.
lb view: b view.
lb addRectanglePolymetricWidth: 'number of methods' height: 'Line of code'.
lb build.

b
-=-=-=-=-=-=-=-=

"
Class {
	#name : #CALegendBuilder,
	#superclass : #CABuilder,
	#instVars : [
		'items',
		'group',
		'legendElement',
		'offset',
		'position',
		'isOnDemand',
		'textSize',
		'gapSize',
		'isFixed',
		'onDemandText',
		'boxShape',
		'nestBlock'
	],
	#category : #'Carlone-Builder-Legend'
}

{ #category : #'instance creation' }
CALegendBuilder class >> on: aCompose [
	| i |
	i := self new.
	i root: aCompose.
	^ i.
]

{ #category : #'public - convenient' }
CALegendBuilder >> addColor: aColor object: anObject text: aBlockOrSelector [
	"Associate a color with a text"
	items add: (CAColorLegendItem new color: aColor; model: anObject; text: aBlockOrSelector;
	textSize: self textSize)
]

{ #category : #'public - convenient' }
CALegendBuilder >> addColor: aColor text: aText [
	"Associate a color with a text"
	^ self addColor: aColor object: aText text: #yourself
]

{ #category : #'public - convenient' }
CALegendBuilder >> addColorFadingFrom: startColor to: endColor text: textualDescription [
	"Add a fading between startColor and endColor. A textualDescription is provided"
	self addColorFadingUsing: (Array with: startColor with: endColor) text: textualDescription
]

{ #category : #'public - convenient' }
CALegendBuilder >> addColorFadingUsing: colors text: textualDescription [
	"Specify a description of a fading using a provided set of colors"
	items
		add:
			(CAColorFadingLegendItem new
				colors: colors;
				description: textualDescription)
]

{ #category : #'public - convenient' }
CALegendBuilder >> addColoredObject: anObject text: aTextOrSymbolOrBlock color: aColor [
	items add: (CALabelLegendItem new model: anObject; text: aTextOrSymbolOrBlock; color: aColor; textSize: self textSize)
]

{ #category : #'public - convenient' }
CALegendBuilder >> addColoredText: aText color: aColor [
	^ self addColoredObject: nil text: aText color: aColor

]

{ #category : #'public - convenient' }
CALegendBuilder >> addLineColor: aColor text: aText [
	"Associate a color with a text"
	items add: (CALineLegendItem new color: aColor; text: aText; textSize: self textSize)
]

{ #category : #'public - convenient' }
CALegendBuilder >> addObject: anObject text: aTextOrASymbolOrBlock [
	^ self addColoredObject: anObject text: aTextOrASymbolOrBlock color: Color lightGray
]

{ #category : #'public - convenient' }
CALegendBuilder >> addRectanglePolymetricWidth: widthDescription height: heightDescription box: boxDescription [
	"Associate a color with a text"

	items add: (RTPolymorphicBoxLegendItem new 
						widthDescription: widthDescription;
						heightDescription: heightDescription;
						boxDescription: boxDescription;
						textSize: self textSize)
]

{ #category : #'public - convenient' }
CALegendBuilder >> addText: aText [
	"Add a text to the legend, simply"
	self addColoredText: aText color: self textColor
]

{ #category : #hooks }
CALegendBuilder >> backgroundBoxElement [
	| e |
	e := self backgroundShape elementOn: nil.
	self interaction setUpElement: e.
	^ e
]

{ #category : #accessing }
CALegendBuilder >> backgroundShape [
	^ boxShape
]

{ #category : #configuration }
CALegendBuilder >> backgroundTransparencyOnDemand [
	^ 0.9
]

{ #category : #'public - positioning' }
CALegendBuilder >> below [
	self positionDo: [ :p | 
		p 
			outer;
			verticalPadding: offset;
			bottom;
			center;
			move.
		 ].
]

{ #category : #initialization }
CALegendBuilder >> defaultOffset [
	^ 20
]

{ #category : #accessing }
CALegendBuilder >> gapSize [
	^ gapSize
]

{ #category : #accessing }
CALegendBuilder >> gapSize: aNumber [
	gapSize := aNumber
]

{ #category : #accessing }
CALegendBuilder >> group [
	"Return all the elements"
	| myGroup |
	myGroup := RTGroup new.
	items do: [ :item | myGroup add: item execute ].
	RTVerticalLineLayout new
		gapSize: gapSize;
		on: myGroup.
	^ myGroup
]

{ #category : #initialization }
CALegendBuilder >> initialize [
	super initialize.
	"Thisi group variable should be removed"
	group := CAGroup new.
	
	offset := self defaultOffset.
	self below.
	self nestDo: [ :n :e :g | n on: e nest: g ].
	"self interaction draggable."
	isOnDemand := false.
	textSize := 12.
	gapSize := 10.
	items := OrderedCollection new.
	boxShape := CAGeometryShape box
		background: Color white.
	
	isFixed := false
]

{ #category : #'public - positioning' }
CALegendBuilder >> left [
	self positionDo: [ :p |
		p
			outer;
			left;
			horizontalPadding: offset;
			middle;
			move.
		 ].
]

{ #category : #accessing }
CALegendBuilder >> legendElement [
	^ legendElement
]

{ #category : #'public - positioning' }
CALegendBuilder >> nestDo: aBlockThreeArg [
	"read documentation of RTNest to position elements in the legend"
	nestBlock := aBlockThreeArg 
]

{ #category : #'private - utility' }
CALegendBuilder >> newLabelShape: widthDescription [
	"Return a new label with the argument as the content of the label"
	^ RTLabel new color: self textColor; text: widthDescription; yourself
]

{ #category : #initialization }
CALegendBuilder >> offset [
	^ offset
]

{ #category : #initialization }
CALegendBuilder >> offset: aDistanceInPixel [
	offset := aDistanceInPixel 
]

{ #category : #accessing }
CALegendBuilder >> onDemand [
	"Make the legend appear if the user move the mouse on a particular icon in the visualization"
	isOnDemand := true.
	onDemandText := '?'.
]

{ #category : #accessing }
CALegendBuilder >> onDemand: text [
	self onDemand.
	onDemandText := text
]

{ #category : #'public - positioning' }
CALegendBuilder >> positionDo: aBlockOneArg [
	position := aBlockOneArg 
]

{ #category : #rendering }
CALegendBuilder >> renderIn: aView [
	| background |
	super renderIn: aView.

	background := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent.
			"will take 100% of the parent"
			c linear weight: 1 ];
		yourself.	
	items do: [ :item | background addChild: item execute ].
	self root addChild: background




]

{ #category : #hooks }
CALegendBuilder >> renderOnDemandIn: aView [
	| label myGroup |
	super renderIn: aView.
	RTVerticalLineLayout on: group.
	label := (RTLabel new color: Color red) elementOn: onDemandText.
	label setAsFixed.
	label @ RTHighlightable.
	aView add: label.
	label translateTo: label extent / 2.
	label
		@
			(RTPopup new
				alphaPopupBackground: self backgroundTransparencyOnDemand;
				background: Color white
					group: [ :gg :el | 
					myGroup := self group.
					gg addAll: (myGroup flatCollect: #yourself) ])
]

{ #category : #'public - positioning' }
CALegendBuilder >> right [
	self positionDo: [ :p |
		p 
			outer;
			right;
			middle;
			horizontalPadding: offset;
			move.
		 ].
]

{ #category : #configuration }
CALegendBuilder >> setAsFixed [

	"The legend is fixed, therefore not subject to the camera movement.
	This is handy if the visualization is very large (ie. if not fixed, then the legend may appear very small"
	isFixed := true
]

{ #category : #configuration }
CALegendBuilder >> textColor [
	^ Color lightGray
]

{ #category : #accessing }
CALegendBuilder >> textSize [
	^ textSize
]

{ #category : #accessing }
CALegendBuilder >> textSize: aSizeAsInteger [
	textSize := aSizeAsInteger
]

{ #category : #'public - positioning' }
CALegendBuilder >> top [
	self positionDo: [ :p | 
		p 
			outer;
			verticalPadding: offset;
			top;
			center;
			move.
		 ].
]
