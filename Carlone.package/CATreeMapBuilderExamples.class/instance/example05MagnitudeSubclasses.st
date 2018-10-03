examples
example05MagnitudeSubclasses
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
	color: Color black;
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