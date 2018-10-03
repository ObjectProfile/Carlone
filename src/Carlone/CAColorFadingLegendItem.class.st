Class {
	#name : #CAColorFadingLegendItem,
	#superclass : #CALegendItem,
	#instVars : [
		'colors',
		'description'
	],
	#category : #'Carlone-Builder-Legend'
}

{ #category : #accessing }
CAColorFadingLegendItem >> colors: aCollectionOfColors [
	colors := aCollectionOfColors
]

{ #category : #accessing }
CAColorFadingLegendItem >> description [
	^ description
]

{ #category : #accessing }
CAColorFadingLegendItem >> description: aString [
	description := aString
]

{ #category : #hooks }
CAColorFadingLegendItem >> execute [
	
	| background box textElement |
	background := BlElement new
		layout: BlLinearLayout horizontal;
		background: Color veryDarkGray;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			"will take 100% of the parent"
			c linear weight: 1 ];
		yourself.	
	
	box := CAGeometryBuilder box
		background: (BlLinearGradientPaint new
        stops: {
            (0.0 -> colors first).
            (1.0 -> colors last)};
        start: 0@0;
        end: 100@0;
        yourself);
		matchExtent: 50 @ 20;
		element.
	
	textElement := CALabelShape label
		text: description;
		element.
		
	background addChild: box; addChild: textElement.
	^ background
"	| g shape es n label |
	g := RTGroup new.
	
	shape := RTBox new width: 3; height: 20.
	es := shape elementsOn: (1 to: 50).
	g addAll: es.
	RTHorizontalLineLayout new gapSize: -1; on: es.
	
	n := RTMetricNormalizer new.
	n elements: es.
	n normalizeColor: #yourself using: colors.
	
	label := (self newLabelShape: description) element.
	g add: label.
	RTConstraint move: label onTheRightOf: es.
	label translateBy: 20 @ 0.
	
	^ g"
]
