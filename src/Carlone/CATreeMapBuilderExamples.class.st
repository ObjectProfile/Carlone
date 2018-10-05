"
I have the examples for this builder
"
Class {
	#name : #CATreeMapBuilderExamples,
	#superclass : #CAAbstractExamples,
	#category : #'Carlone-Examples'
}

{ #category : #examples }
CATreeMapBuilderExamples >> example01Basic [
	<script: 'self new example01Basic inspect'>
	| b |
	b := CATreeMapBuilder new.
	b shape background: Color random.
	
	b from: (1 to: 5).
	b weight: #yourself.
	b build.
	^ b 
]

{ #category : #examples }
CATreeMapBuilderExamples >> example02Basic [
	<script: 'self new example02Basic inspect'>
	| b labels label |
	b := CATreeMapBuilder new.
	b shape background: Color veryLightGray.
	labels := #('uno' 'dos' 'tres' 'cuatro' 'cinco' 'Forrest Law'). 
	b from: labels.
	b weight: [:n| n size].
	b build.
	label := CALabelShape label.
	b elements do: [ :e | | lb | 
		lb := label elementOn: e caModel.
		e addChild: lb.
		lb computeLayout.
		lb relocate: (e measuredBounds extent - lb extent)/2 ].
	^ b 
]

{ #category : #examples }
CATreeMapBuilderExamples >> example03TreemapNumbers [
	<script: 'self new example03TreemapNumbers inspect'>
	| b |
	b := CATreeMapBuilder new.
	b shape 
		background: Color gray;
		if: #even actions: [ :s | s background: Color veryLightGray].
	b 
		extent: 400 asPoint;
		explore: 1
			using: [ :n | n < 8 
				ifTrue: [ Array with: n + 1 with:  n + 2 ] 
				ifFalse: [ #() ] ];
		weight: #yourself.
	b build.

	^ b 
]

{ #category : #examples }
CATreeMapBuilderExamples >> example04CollectionSubclasses [
	<script: 'self new example04CollectionSubclasses inspect'>
	| b |
	b := CATreeMapBuilder new.
	b shape
		background: Color gray;
		border: (BlBorder builder paint: Color black; width: 0.5; build);
		if: [ :cls | (Smalltalk classNamed: cls name, 'Test') notNil ]
			actions: [ :s | s background: Color green ].
	b
		leafWeight: #linesOfCode;
		explore: Collection using: #subclasses;
		build.
	^ b
]

{ #category : #examples }
CATreeMapBuilderExamples >> example05MagnitudeSubclasses [
	<script: 'self new example05MagnitudeSubclasses inspect'>
| b color lines shape |
b := CATreeMapBuilder new.
b extent: 700@800.
b root @ CADraggable.
color := CAScale category20.
color range: (color range collect: [ :c |
	c alpha: 0.6 ]).
lines := CAScale sqrt.
b 
	leafWeight: [:cls | lines scale: cls linesOfCode  ];
	explore: Magnitude using: #subclasses;
	build.
shape := CALabelShape label
	foreground: Color black;
	addEventHandler: BlPullHandler new.
	
b elements do: [ :el | | p |
	p := el.
	[ p caIndex > 2 ] whileTrue: [ p := p userData at: #parent ].
	el background: (color scale: p caModel) ].

b elements 
	select: [ :el | (el userData at: #children) isEmpty ]
	thenDo: [ :el |
		| label ex sc lex |
		label := shape elementOn: el caModel.
		label computeLayout.
		lex := label extent.
		ex := el extent.
		ex y > ex x ifTrue: [ 
			label transform
				inherit;
				origin: (BlAffineTransformationPositionOrigin position: lex / 2 );
				rotateBy: -90;
				apply ].
		label computeLayout.
		lex := label extent.
		sc := ex max / lex max.
		(lex min * sc > ex min) ifTrue: [ 
			sc := ex min / lex min ].
		label transform 
			inherit;
			origin: (BlAffineTransformationPositionOrigin position: lex / 2);
			scaleBy: (BlVector x: sc asPoint x y: sc asPoint y z: 1);
			apply.
		label computeLayout.
		lex := label measuredExtent.
		el addChild: label.
		label relocate: ((ex / 2) - (lex /2))
		 ].
^ b
]
