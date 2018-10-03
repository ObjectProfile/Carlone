"
I have te basic examples
"
Class {
	#name : #CABasicExamples,
	#superclass : #CAAbstractExamples,
	#category : #'Carlone-Examples'
}

{ #category : #'pie - examples' }
CABasicExamples >> createPieBuilder [
	| b classes |
	classes := Array with: Dictionary with: OrderedCollection with: String with: Set with: Array.
	b := CAPieBuilder new.
	b objects: classes.
	b slice: #numberOfMethods.
	^ b
]

{ #category : #'pie - examples' }
CABasicExamples >> createPieBuilder2 [
	| b r |
	r := Random new.
	b := CAPieBuilder new.
	b objects: ((1 to: 10) collect: [:e | r next]) sort.
	^ b
]

{ #category : #'pie - examples' }
CABasicExamples >> esportPrizepool [
	"source https://www.esportsearnings.com/games"
	| arr data |
	arr := {
		{'Dota' . 2013 . 2874380}.
		{'Dota' . 2014 . 10931105}.
		{'Dota' . 2015 . 18429613}.
		{'Dota' . 2016 . 20770460}.
		{'Dota' . 2017 . 24787916}.
		{'SC2' . 2013 . 250000}.
		{'SC2' . 2014 . 250000}.
		{'SC2' . 2015 . 250000}.
		{'SC2' . 2016 . 500000}.
		{'SC2' . 2017 . 700000}.
		{'LOL' . 2013 . 246575}.
		{'LOL' . 2014 . 2130000}.
		{'LOL' . 2015 . 2130000}.
		{'LOL' . 2016 . 5070000}.
		{'LOL' . 2017 . 4946969}}.
	data := Dictionary new.
	arr do: [ :d | 
		| list |
		list := data at: d first ifAbsentPut: [ OrderedCollection new ].
		list add: d second -> d third ].
	^ data
	
]

{ #category : #'moz2d - examples' }
CABasicExamples >> example01BasicCircularArcs [
	<script: 'self new example01BasicCircularArcs inspect' >
	| canvas path |
	
	canvas := MozCanvas extent: 400 @ 400.
	path := canvas path
		moveTo: 80 @ 80;
		ellipticalArc2: 45 @ 45
			xrot: 0
			large: 0
			sweep: 0
			to: 125 @ 125;
		lineTo: 125 @ 80;
		close;
		build.
	canvas fill
		paint: Color green;
		path: path;
		draw.
	canvas stroke
		paint: Color black;
		path: path;
		draw.
	path := canvas path
		moveTo: 230 @ 80;
		ellipticalArc2: 45 @ 45
			xrot: 0
			large: 1
			sweep: 0
			to: 275 @ 125;
		lineTo: 275 @ 80;
		close;
		build.
	canvas fill
		paint: Color red;
		path: path;
		draw.
	canvas stroke
		paint: Color black;
		path: path;
		draw.
	path := canvas path
		moveTo: 80 @ 230;
		ellipticalArc2: 45 @ 45
			xrot: 0
			large: 0
			sweep: 1
			to: 125 @ 275;
		lineTo: 125 @ 230;
		close;
		build.
	canvas fill
		paint: Color purple;
		path: path;
		draw.
	canvas stroke
		paint: Color black;
		path: path;
		draw.
	path := canvas path
		moveTo: 230 @ 230;
		ellipticalArc2: 45 @ 45
			xrot: 0
			large: 1
			sweep: 1
			to: 275 @ 275;
		lineTo: 275 @ 230;
		close;
		build.
	canvas fill
		paint: Color blue;
		path: path;
		draw.
	canvas stroke
		paint: Color black;
		path: path;
		draw.
	^ canvas
]

{ #category : #'pie - examples' }
CABasicExamples >> example01BasicPie [
	<script: 'self new example01BasicPie inspect' >
	| b |
	b := self createPieBuilder. 
	b build.
	^ b
]

{ #category : #'polygon - examples' }
CABasicExamples >> example01CircleWaves [
	<script: 'self new example01CircleWaves inspect' >
	| size time root vertices shape elements |
	size := 500.
	time := DateAndTime now.
	root := BlElement new
		background: Color white;
		size: size asPoint.
	
	vertices := [ :e | | points |
		points := BlPolygon 
			generateUnitNgonPoints: 200
		 	rotation: 0 
			angle:  [ :a :i | a ]
			radius: [ :a :i | | t |
				t := (DateAndTime now - time) asMilliSeconds / 1000.0.
				200 + (((a * 8) - ((e caIndex * 2 * Float pi) / 3) + t ) cos * 
				(((1 + (a - t) cos) / 2) raisedTo: 3) * 32 )
				 ].
		points doWithIndex: [ :p :i | 
			points at: i put: p + ((size asPoint)/2) ] ].
	shape := CAGeometryBuilder polygon
		border: [ :m | BlBorder builder
			paint: ((Color colorFrom: m) alpha: 0.4) ; 
			width: 10; build ];
		background: Color transparent;
		onElement;
		vertices: vertices.
	elements := shape elementsOn: #('#15c108' '#8d0402' '#0002ab').
	root addChildren: elements.
	root addAnimation: (BlNumberTransition new from: 0; to: 1; beInfinite; duration: 1 second;
		onStepDo: [ :t | 
			elements do: [ :e |
				e geometry 
					vertices: (vertices caValue: e);
					releaseCache ].
			root invalidate.
			]).
	^ root
]

{ #category : #'shapes  - examples' }
CABasicExamples >> example01Ellipse [
	<script: 'self new example01Ellipse inspect' >
	| data root shape radius center color |
	
	data := 0 to: 358 by: 2.
	root := BlElement new
		size: 500 asPoint.
	center := 250 asPoint.
	radius := CAScale linear
		domain: #(1 10);
		range: #(180 240).
	color := CAScale linear
		domain: #(1 7 10);
		range: #('brown' '#4682b4' 'brown').
	1 to: 10 do: [ :k | 
		shape := CAGeometryBuilder ellipse
			matchExtent: 9 @ 9;
			background: (color scale: k);
			border: (BlBorder builder paint: Color black; width: 1; build);
			relocate: [:a | | d r x y |
				d := a degreesToRadians.
				r := radius scale: k.
				x := d cos * r.
				y := d sin * r.
				(x @ y)+center ].
		root addChildren: (shape elementsOn: data) ].
	^root.
]

{ #category : #'shapes  - examples' }
CABasicExamples >> example02Arc [
	<script: 'self new example02Arc inspect' >
	| step theta root shape bScale bloc elements |
	step := 12.
	theta := 0.
	root := BlElement new
		background: Color black;
		size: 800 @ 600.
	
	bScale := CAScale linear
		domain: #(-1 1);
		range: #(180 360).
	bloc := [ :e | | offset |
		offset := Float pi * 2 / 21 * e caModel.
		bScale scale: (theta + offset) sin ].
	shape := CAGeometryBuilder arc
		background: Color white;
		innerRadius: [ :m | m * step ];
		externalRadius: [ :m | m * step + 5 ];
		alphaAngle: 180;
		relocate: [ :m | 300 @ 0 - (m * step) - 5 ];
		onElement;
		betaAngle: bloc.
		
	elements := shape elementsOn: (1 to: 21).
	root addChildren: elements.
	root addAnimation: (BlNumberTransition new 
		from: 0; to: 1; beInfinite; 
		duration: 1 second;
		onStepDo: [ :t | 
			theta := theta + 0.0523.
			elements do: [ :e | 
				e geometry betaAngle: (bloc caValue: e); releaseCache.
				e background: (Color h: theta * 2 + (e caModel * 10) s: 1 l: 0.5) ].
			root invalidate ]).
	^ root
]

{ #category : #'pie - examples' }
CABasicExamples >> example02EmphasizeArc [
	<script: 'self new example02EmphasizeArc inspect' >
	| b |
	b := self createPieBuilder. 
	b emphasize: Array by: 20.
	b build.
	^ b
]

{ #category : #'polygon - examples' }
CABasicExamples >> example02ManyPolygons [
	<script: 'self new example02ManyPolygons inspect'>
	| root border shape shadow  |
	root := BlElement new
		background: Color white;
		constraintsDo: [ :c | 
			c horizontal matchParent. 
			c vertical matchParent ];
		yourself.
	border := BlBorder builder 
		paint: Color black;
		width: 2;
		build.
	shadow := [ BlDropShadowEffect 
		color: Color black 
		width: 20
		offset: 10@10 ].
	#('diamond' 'square' 'heptagon' 'hexagon' 
	'octagon' 'pentagon' 'rhomboid' 'star'
	'triangle' 'vee' "not polygons" 'box' 'circle') doWithIndex: [ :m :i | 
		| p |
		p := (i-1%4)@(i-1//4).
		shape := (CAGeometryBuilder perform: m asSymbol)
			geometryExtent: 100 asPoint;
			relocate: (p * 120)+ 10;
			background: Color random;
			border: border;
			effect: shadow.
		root addChild: (shape elementOn: m) @ CAPopup.
		 ].
	^ root 
]

{ #category : #'shapes  - examples' }
CABasicExamples >> example03ArcCarlone [
	<script: 'self new example03ArcCarlone inspect'>
	| step theta root shape elements |
	step := 15.
	theta := 0.
	root := BlElement new
		background: Color black;
		size: 500 @ 500.
	shape := CAGeometryBuilder arc
		innerRadius: [ :m | m * step + 7];
		externalRadius: [ :m | m * step + 10 ];
		relocate: [ :m | 250 asPoint - (m * step) - 10 ].
	elements := shape elementsOn: (1 to: 16).
	root addChildren: elements.
	root addAnimation: (BlNumberTransition new 
		from: 0; to: 1; beInfinite; duration: 1 second;
		onStepDo: [ :t | 
			theta := theta + 0.2.
			elements do: [ :e | 
				e geometry 
					alphaAngle: 30 + (theta * e caModel);
					betaAngle: 300 + (theta * e caModel);
					releaseCache.
				e background: (Color h: theta * e caModel s: 1 l: 0.5) ].
			root invalidate ]).
	^ root
]

{ #category : #'pie - examples' }
CABasicExamples >> example03PlayingWithShape [
	<script: 'self new example03PlayingWithShape inspect'>
	| b |
	b := self createPieBuilder. 
	b shape 
		externalRadius: 80;
		innerRadius: 50;
		border: (BlBorder paint: Color black);
		if: [ :cls | cls numberOfMethods > 100  ] actions: [ :s |
			s externalRadius: 90 ].
	b build.
	^ b
]

{ #category : #'polygon - examples' }
CABasicExamples >> example03Stars [
	<script: 'self new example03Stars inspect'>
	| root random border color box star elements |
	root := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent. 
			c vertical matchParent ];
		yourself.
	random := SharedRandom globalGenerator.
	border := BlBorder builder 
		paint: (Color black);
		width: 1;
		build.
	color := CAScale linear 
		domain: #(0 10);
		range: #('black' 'blue').
	
	box := CAGeometryBuilder box
		matchExtent: 39 asPoint;
		background: [ :m | color scale: m-1 // 10 ];
		relocate: [ :m | | p |
			p := (m -1% 10) @ (m -1// 10).
			p * 40 ].
	root addChildren: (box elementsOn: (1 to: 100)).
	
	star := CAGeometryBuilder star
		background: Color white;
		border: border;
		sides: [ (random caNext: 5 and: 10) asInteger ];
		innerRadius: [ random caNext: 0.15 and: 0.8 ];
		geometryExtent: [ (random caNext: 10 and: 100) asPoint ];
		relocate: [ 
			(random caNext: 50 and: 300)@
			(random caNext: 50 and: 300) ];
		effect: [BlDropShadowEffect 
				color: Color white 
				width: 20
				offset: (random caNext: -20 and: 20)@
					(random caNext: -20 and: 20) ].
	elements := star elementsOn: (1 to: 5).
	root addChildren: elements.
	root addAnimation: (BlNumberTransition new 
		beInfinite; duration: 3 seconds; from: 0; to: 360;
		onStepDo: [ :t | 
			elements do: [ :e | 
				e geometry 
					rotation: t;
					releaseCache.
				e invalidate.] ]).
	^ root.
	
]

{ #category : #'polygon - examples' }
CABasicExamples >> example04AnimatedStar [
	<script: 'self new example04AnimatedStar inspect'>
	| root extent iradius star e |
	root := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent. 
			c vertical matchParent ];
		yourself.
	extent := 200 asPoint.
	iradius := CAScale linear 
		domain: #(0 0.5 1);
		range: #(0.05 0.9 0.05).
	star := CAGeometryBuilder star
		background: (BlLinearGradientPaint  new
			stops: {
				0 -> Color blue.
				1 -> Color green};
			start: 0@0;
			end: extent);
		rotation: 0;
		geometryExtent: extent;
		border: (BlBorder paint: Color black);
		effect: (BlDropShadowEffect color: Color veryLightGray width: 30 offset: 20@20).
	root addChild: (e := star element).
	root addAnimation: (BlNumberTransition new 
		from: 0; to: 1; beInfinite; duration: 2 second;
		onStepDo: [ :t |
			e geometry 
				innerRadius: (iradius scale: t);
				releaseCache.
			e invalidate]). 
	^ root.
]

{ #category : #'pie - examples' }
CABasicExamples >> example04PieColors [
	<script: 'self new example04PieColors inspect'>
	
	| b colors |
	b := self createPieBuilder. 
	colors := CAScale ordinal rangeFrom: #('#1f77b5' '#2ca02c' '#d62728' '#9467bd' '#7f7f7f').
	b shape 
		background: colors;
		externalRadius: 80;
		innerRadius: 50;
		onModel;
		if: [:m | m == String] actions: [ :s |
			s
				background: Color black;
				innerRadius: 20 ].
	b build.
	^ b
]

{ #category : #'shapes  - examples' }
CABasicExamples >> example04YoviRetina [
	<script: 'self new example04YoviRetina inspect'>
	| ringCant circleCant minR width random ang root shape perlin |
	ringCant := 100.
	circleCant := 100.
	minR := 0.08.
	width := 900.
	random := SharedRandom globalGenerator.
	ang := CAScale linear 
		domain: {1. circleCant};
		range: {0. 360}.
	root := BlElement new
		background: Color black;
		size: width @ width.
	perlin := CAPerlinNoise new.
	1 to: ringCant do: [ :i | | offset R r v |
		offset := random caNext: 90.
		R := random caNext:  minR * width and: 1 / 2 sqrt * width.
		v := R / width * 100.
		r := ((R / (width /2))-minR)* ((perlin noise: v and: v) abs) * width / 6.
		shape := CAGeometryBuilder circle
			matchExtent: r * 2 asPoint;
			background: Color transparent;
			border: [ :m | | phi|
				phi := ang scale: m.
				BlBorder builder paint:( Color 
					h: (phi + offset)
					s: 1 v: 1 alpha: 0.7); width: 1; build ];
			relocate: [ :m | | phi |
				phi := (ang scale: m) degreesToRadians.
				((phi cos * R) @ (phi sin * R))+(width asPoint / 2) - r.
				].
		root addChildren: (shape elementsOn: (1 to: circleCant)) ].
	^ root
	
]

{ #category : #'pie - examples' }
CABasicExamples >> example05SegmentSpacing [
	<script: 'self new example05SegmentSpacing inspect'>
	| b |
	b := self createPieBuilder. 
	b shape 
		externalRadius: 240;
		innerRadius: 200;
		segmentSpacing: 1.
	b build.
	^ b
]

{ #category : #'shapes  - examples' }
CABasicExamples >> example05SpaceDandy [
	<script: 'self new example05SpaceDandy inspect'>
	| random width height diagonal rotation init drawDist root shape elements |
	random := SharedRandom globalGenerator.
	width := 800.
	height:= 600.
	diagonal := ((width * width) + (height * height)) sqrt / 2.
	rotation := 0.

	init := [ :e | | n |
		e userData 
			at: #l put: 1;
			at: #n put: (n := random caNext: 1 and: width/2);
			at: #r put: (random caNext: Float pi * 2);
			at: #o put: (random caNext: 1 and: (random caNext: 1 and: width / n )) ].
	drawDist := [ :e | | n o |
		n := e userData at: #n.
		o := e userData at: #o.
		(n / o) arcTan * width / (Float pi / 2) ].
	
	root := CAWindowsCrashElement new
		background: Color black;
		size: width @ height.
	root 
		when: BlMouseDownEvent do: [ :evt | root crash: true ];
		when: BlMouseUpEvent do: [ :evt | root crash: false ].
	
	shape := CAGeometryBuilder ellipse
		background: Color white.
	
	elements := shape elementsOn: (1 to: 500).
	elements do: [ :e | init value: e ].
	root addChildren: elements.
	root addAnimation: (BlNumberTransition new 
		from: 0; to: 1; beInfinite; duration: 1 second;
		onStepDo: [ :t | 
			rotation := rotation - 0.002.
			elements do: [ :e | | l o r d s color |
				l := (e userData at: #l) + 1.
				e userData at: #l put: l.
				r := (e userData at: #r) + rotation.
				o := e userData at: #o.
				d := drawDist value: e.
				color := Color h: (e userData at: #r) radiansToDegrees s: 1 v: 0.5 alpha: (1 min: l / 255 ).
				rotation > (Float pi * -2) 
					ifTrue: [ color := CAScale linear domain: { 0. Float pi * -2 }; range: { Color white. color }; scale: rotation ].
				e background: color.
				e size: (s := (width/o/8) asPoint).
				e relocate: ((r cos @ r sin) * d )+ ((width @ height) / 2) - (s/2).
				e userData at: #o put: o - 0.07.
				(drawDist value: e) > diagonal ifTrue: [ init value: e ].
				 ].
			root invalidate.
			 ]).
	^ root
	
]

{ #category : #'shapes  - examples' }
CABasicExamples >> example06ArcNoise [
	<script: 'self new example06ArcNoise inspect'>
	| root shape perlin bloc radius frame elements |
	root := BlElement new
		background: Color black;
		size: 600 asPoint.
	frame := 0.
	perlin := CAPerlinNoise new.
	radius := CAScale linear domain: #(1 20); range: #(50 250).
	bloc := [ :e | | t |
		t := (frame * 0.025) + ((radius scale: e caModel) * 0.0005).
		360 * (perlin noise: t and: 0.01) abs ].
	shape := CAGeometryBuilder arc
		background: Color white;
		innerRadius: [ :m | (radius scale: m)- 5 ];
		externalRadius: [ :m | radius scale: m];
		alphaAngle: 0;
		relocate: [ :m | 300 asPoint - (radius scale: m)];
		onElement;
		betaAngle: bloc.
	root addChildren: (elements := shape elementsOn: (1 to: 20)).
	
	root addAnimation: (BlNumberTransition new 
		beInfinite; duration: 2 seconds; from: 0; to: 1;
		onStepDo: [:k| 
			frame := frame + 0.2.
			elements do: [ :e | | a |
				e geometry 
					betaAngle: (a := bloc caValue: e);
					releaseCache.
				e background: (Color h: a s: 0.5 v: 1). ].
			root invalidate.
			]).
	^ root
	"space := BlSpace new.
	space time: (BlTime fastForwarded speed: 0.1).
	space addChild: root.
	space show"
]

{ #category : #'pie - examples' }
CABasicExamples >> example06SegmentSpacing2 [
	<script: 'self new example06SegmentSpacing2 inspect'>
	| b |
	b := self createPieBuilder2. 
	b shape 
		externalRadius: 240;
		innerRadius: 20;
		segmentSpacing: 2;
		border: (BlBorder builder paint: Color black; width: 1.5; build).
	b build.
	^ b
]

{ #category : #'shapes  - examples' }
CABasicExamples >> example07RainbowArc [
	<script: 'self new example07RainbowArc inspect'>
	| radius root shape |
	radius := CAScale pow
		exponent: 2.2.
	root := BlElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].
	1 to: 7 do: [ :i | | index |
		index := i + 6.
		shape := CAGeometryShape arc
			innerRadius: (radius scale: index);
			externalRadius: (radius scale: index + 1);
			relocate: [ 350 asPoint - (radius scale: index + 1) ];
			alphaAngle: [ :m | m + (i * 50) - 320 + 3 ];
			betaAngle: [ :m | m + 20 + (i * 50) - 320 - 3 ];
			background: [:m | (Color h: m s: 0.5 l: 0.5) lighter ];
			if: [ :m | m > 180] 
				background: [ :m | (Color h: m s: 0.5 l: 0.5) darker ];
			if: [ :m | m = 240] 
				background: [ :m | (Color h: m s: 0.5 l: 0.5) adjustBrightness: -0.2 ];
			if: [ :m | m = 260] 
				background: [ :m | (Color h: m s: 0.5 l: 0.5) muchDarker].
		root addChildren: (shape elementsOn: (0 to: 360 by: 20)).
		 ].
	^ root
]

{ #category : #'pie - examples' }
CABasicExamples >> example07SegmentSpacingWithInnerRadiusZero [
	<script: 'self new example07SegmentSpacingWithInnerRadiusZero inspect'>
	| b |
	b := self createPieBuilder. 
	b shape 
		externalRadius: 240;
		"innerRadius: 0;"
		segmentSpacing: 5.
	b build.
	^ b
]

{ #category : #'shapes  - examples' }
CABasicExamples >> example08DownloadingWithArcs [
	<script: 'self new example08DownloadingWithArcs'>
	<noTest>
	| root aAngle shape element update client image win |
	root := BlElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].
	aAngle := CAScale linear
		domain: #(0 25 100);
		range: #(90 0 -270).
	shape := CAGeometryShape arc
		innerRadius: 80;
		externalRadius: 90;
		alphaAngle: 0;
		betaAngle: 360;
		background: Color lightGray;
		relocate: [ 100 asPoint - 90 ].
	root addChild: shape element.
	shape := CAGeometryShape arc 
		innerRadius: 78;
		cornerRadius: 10;
		externalRadius: 92;
		alphaAngle: 0;
		betaAngle: 90;
		background: Color gray;
		relocate: [ 100 asPoint - 92 ].
	root addChild: (element := shape element).
	update := [ :t | 
		element geometry
			alphaAngle: (aAngle scale: t);
			releaseCache.
		root invalidate. ].
	win := (Smalltalk tools inspector openOn: root)
		position: 0@0;
		extent: 300 asPoint;
		yourself.
[ :bar |
	bar title: 'Downloading...'.
	[ 
	update value: 0.
	(client := ZnEasy client)
		url: 'https://www.rutaverdebolivia.com/wp-content/uploads/edge-of-the-milky-way-Daniel-Kordan-e1484657466299.jpg';
		accept:  ZnMimeType imageJpeg;
		enforceHttpSuccess: true;
		enforceAcceptContentType: true;
		signalProgress: true;
		get.
	
	update value: 100.
	image := ImageReadWriter formFromStream: client entity readStream.
	root background: (BlBackground builder
		image: image;
		build).
	win extent: image extent + (0@100) ] on: HTTPProgress 
	do: [ :progress |
		progress isEmpty ifFalse: [ 
			bar current: progress percentage.
			update value: progress percentage ].
		progress resume.
		 ] 
] asJob run
]

{ #category : #'pie - examples' }
CABasicExamples >> example08PieAnimation [
	<script: 'self new example08PieAnimation inspect'>
	| b |
	b := CAPieBuilder new.
	b objects: #(3 3 2 2 5 8 14).
	
	b shape
		innerRadius: 50;
		externalRadius: 200;
		border: (BlBorder builder paint: Color black; width: 1.5; build).
	b build.
	b root addAnimation: (BlNumberTransition new from: 0; to: 180; duration: 10 seconds; beInfinite;
		onStepDo: [ :t |
			b elements do: [ :el | | op |
				op := 125 - (t degreesToRadians sin abs * 125).
				el geometry 
					segmentSpacing: op;
					releaseCache ].
			b root invalidate ]).
	
	^ b
]

{ #category : #'pie - examples' }
CABasicExamples >> example09ExtendingArcs [
	<script: 'self new example09ExtendingArcs inspect'>
	| b eRadius |
	b := self createPieBuilder2.
	eRadius := 200.
	b shape
		innerRadius: 50;
		externalRadius: eRadius;
		background: Color lightGray;
		border: (BlBorder builder paint: Color black; width: 1.5; build);
		segmentSpacing: 1.
	b centerGap: 50@50.
	b build.

	b elements do: [ :e | | update |
		update := [ :t | 
			e geometry externalRadius: t; releaseCache.
			e size: t * 2 asPoint.
			e relocate: b centerGap - t + eRadius.
			b root invalidate. ].
		e 
			when: BlMouseOverEvent do: [ :evt | 
				e addAnimation: (BlNumberTransition new from: 200; to: 220; 
					duration: 0.2 seconds; onStepDo: update)];
			when: BlMouseOutEvent do: [ :evt | 
				e addAnimation: (BlNumberTransition new from: 220; to: 200; 
					duration: 0.2 seconds; onStepDo: update) ];
			when: BlMouseDownEvent do: [ :evt |
					e background: Color random ] ].
	^ b
]

{ #category : #'pie - examples' }
CABasicExamples >> example10SmashPie [
	<script: 'self new example10SmashPie inspect'>
	| b |
	b := self createPieBuilder2.
	
	b shape
		innerRadius: 0;
		externalRadius: 200;
		cornerRadius: 10;
		border: (BlBorder builder paint: Color black; width: 1.5; build).
	b build.

	b elements doWithIndex: [ :e :i | | u1 u2 |
		e userData 
			at: #a put: e geometry alphaAngle;
			at: #b put: e geometry betaAngle.
		u1 := [:t | 
			e geometry 
				alphaAngle: (e userData at: #a) * t;
				betaAngle: (e userData at: #b)* t;
				releaseCache.
			e invalidate].
		u2 := [:t | 
			e geometry 
				innerRadius: 120*t;
				releaseCache.
			e invalidate].
		e addAnimation: (BlSequentialAnimation new 
			add: (BlNumberTransition new from: 0; to: 1; duration: 2 seconds;
				easing: BlEasing bounceOut;
				onStepDo: u1;
				yourself );
			add: (BlNumberTransition new from: 0; to: 1; duration: 750 milliSeconds;
				delay: (50 * i) milliSeconds;
				easing: (BlEasingElastic2 new) ;
				onStepDo: u2 )).
	].
	^ b
]

{ #category : #'pie - examples' }
CABasicExamples >> example11SmashPie2 [
	<script: 'self new example11SmashPie2 inspect'>
	| b r |
	r := SharedRandom globalGenerator.
	b := CAPieBuilder new.
	b objects: ((1 to: 360) collect: [:e | r next]) sort.
	
	b shape
		onElement;
		innerRadius: 0;
		externalRadius: 200;
		alphaAngle: [:e | e caIndex - 1 ];
		betaAngle: [ :e | e caIndex + 1 ];
		background: [:e | Color h: e caIndex s: 1 l: 0.5].
	b build.

	b elements doWithIndex: [ :e :i | | u1 u2 |
		e userData 
			at: #a put: e geometry alphaAngle;
			at: #b put: e geometry betaAngle.
		u1 := [:t | 
			e geometry 
				alphaAngle: (e userData at: #a) * t;
				betaAngle: (e userData at: #b)* t;
				releaseCache.
			e invalidate].
		u2 := [:t | 
			e geometry 
				innerRadius: 120*t;
				releaseCache.
			e invalidate].
		e addAnimation: (BlSequentialAnimation new 
			add: (BlNumberTransition new from: 0; to: 1; duration: 2 seconds;
				easing: BlEasing bounceOut;
				onStepDo: u1;
				yourself );
			add: (BlNumberTransition new from: 0; to: 1; duration: 2 seconds;
				delay: (10 * i) milliSeconds;
				easing: (BlEasingElastic2 new elasticity: -1 and: 0.30) ;
				onStepDo: u2 )).
	].
	^ b
]

{ #category : #'pie - examples' }
CABasicExamples >> example12DendiPie [
	<script: 'self new example12DendiPie inspect'>
	| b |
	b := self createPieBuilder2.
	
	b shape
		innerRadius: 0;
		externalRadius: 200;
		border: (BlBorder builder paint: Color black; width: 1.5; build).
	b build.

	b elements doWithIndex: [ :e :i | | u alpha beta |
		alpha := e geometry alphaAngle.
		beta := e geometry betaAngle.
		u := [:t | 
			e geometry 
				alphaAngle: alpha * t;
				betaAngle: beta * t;
				releaseCache.
			e invalidate].
		e addAnimation: (BlSequentialAnimation new 
			add: (BlNumberTransition new from: 0; to: 1; duration: 1 seconds ;
				onStepDo: u;
				yourself );
			add: (BlNumberTransition new from: 0; to: 1; duration:  1 seconds;
				delay: 2 seconds;
				onStepDo: [:t |  
					e geometry 
						alphaAngle: alpha + ((360 - alpha) * t);
						betaAngle: beta + ((360 - beta)*t);
						releaseCache.
					e invalidate])).
	].
	^ b
]

{ #category : #'pie - examples' }
CABasicExamples >> example13ArcRadius [
	<script: 'self new example13ArcRadius inspect'>
	| b |
	b := CAPieBuilder new.
	b objects: #(1 1 2 3 5 8 13 21).
	
	b shape
		innerRadius: 220/ 3;
		externalRadius: 220;
		background: Color lightGray;
		border: (BlBorder builder paint: Color black; width: 1.5; build);
		cornerRadius: 30.
	b build.
	^ b
]

{ #category : #'pie - examples' }
CABasicExamples >> example14Rainbow [
	<script: 'self new example14Rainbow inspect'>
	| b |
	b := CAPieBuilder new.
	b objects: (0 to: 360).
	b shape
		innerRadius: 150;
		externalRadius: 200;
		alphaAngle: #yourself;
		betaAngle: [ :d | d +2 ]."to avoid arc spacing"
	b build.
	b root addAnimation: (BlNumberTransition new
		from: 0; to: 500; duration: 2 seconds;
		easing: (BlEasingElastic2 new);
		beInfinite;
		onStepDo: [ :t | b elements do: [:e |
			e background: (Color h: e caModel + t s: 1 l: 0.5)] ]).
	^ b
]

{ #category : #'pie - examples' }
CABasicExamples >> example15ArcRadiusAnimated [
	<script: 'self new example15ArcRadiusAnimated inspect'>
	| b b2 data iradius eradius |
	
	data := #(1 1 2 3 5 8 13 21).
	b := CAPieBuilder new.
	b objects: data.
	iradius := 70.
	eradius := 220.
	b shape
		innerRadius: iradius;
		externalRadius: eradius;
		background: Color transparent;
		border: (BlBorder builder paint: Color lightGray; width: 1.5; build);
		segmentSpacing: 1.
	b build.
	
	b2 := CAPieBuilder new.
	b2 objects: data.
	b2 root: b root.
	
	b2 shape 
		innerRadius: iradius;
		externalRadius: eradius;
		border: (BlBorder builder paint: Color black; width: 1.5; build);
		segmentSpacing: 1.
	b2 build.
	b2 root addAnimation: (BlNumberTransition new
		beInfinite; duration: 2 seconds;
		from: 0; to: 1;
		onStepDo: [:k |
			b2 elements do: [:el | | t |
				t := 1 - ((k - 0.5) abs * 2).
				el geometry 
					cornerRadius: (eradius - iradius )/2 * t;
					releaseCache.
				el invalidate.
				 ] ]).
	^ b
]

{ #category : #'pie - examples' }
CABasicExamples >> example16ArcRadiusAuto [
	<script: 'self new example16ArcRadiusAuto inspect'>
	| b |
	b := CAPieBuilder new.
	b objects: #(1 1 2 3 5 8 13 21).
	b arcRadiusAuto.
	b shape
		innerRadius: 100;
		externalRadius: 220";
		cornerRadius: 30".
	b build.
	^ b
]

{ #category : #'pie - examples' }
CABasicExamples >> example17RainbowAnimation [

	<script: 'self new example17RainbowAnimation inspect'>
	| builder time n d eradius |
	n := 48.
	d := 100.
	time := DateAndTime now.
	builder := CAPieBuilder new
		objects: (1 to: n);
		slice: [ :v | 1 ];
		arcRadiusAuto;
		yourself.
	builder root size: 800@800.
	eradius := [ :e | | t |
		t := (DateAndTime now - time) asMilliSeconds / 1000.0.
		300 +( (t +  ((e caModel /n) * Float pi * 4)) sin * d ) ].
	builder shape
		externalRadius: eradius;
		onModel;
		segmentSpacing: 1;
		innerRadius: 75;
		background: [ :i | | f r g b |
			f := (i / n) * Float pi * 2.
			r := (f + 0) sin * 127 + 128.
			g := (f + 2) sin * 127 + 128.
			b := (f + 4) sin * 127 + 128.
			Color r: r g: g b: b range: 256 ].
	builder root addAnimation: (BlNumberTransition new
		beInfinite; duration: 2 seconds; from: 0; to: 1;
		onStepDo: [:k| 
			builder elements do: [ :e | | r |
				r := eradius caValue: e.
				e geometry 
					externalRadius: r;
					releaseCache.
				e size: r * 2 asPoint.
				e relocate: 400 - r asPoint.
				 ].
			builder root invalidate.
			]).
	builder build.
	^ builder
]

{ #category : #'pie - examples' }
CABasicExamples >> example18LabelInPie [
	<script: 'self new example18LabelInPie inspect'>
	| data builder color |
	"source https://www.indexmundi.com/bolivia/age_structure.html"
	data := { 
		'<=14'->3547498.
		'15-24'->2168047. 
		'25-54'->4174931. 
		'55-64'->657007. 
		'>=65'->590751}.
	"---CARLONE---"
	color := CAScale category20.
	builder := CAPieBuilder new
		objects: data;
		slice: #value;
		centerGap: 10 asPoint.
	builder shape 
		externalRadius: 240;
		innerRadius: 170;
		background: color;
		segmentSpacing: 0.4.
	builder label 
		fontSize: 13;
		fontFamily: 'Courier';
		text: [:obj | obj key,', ',
			(obj value * 100 / builder totalSum) rounded asString, '%' ].
	builder build.
	^ builder
]

{ #category : #'pie - examples' }
CABasicExamples >> example19ManyPies [
	
	<script: 'self new example19ManyPies inspect'>
	| root color titleShape data |
	data := self esportPrizepool.
	root := BlElement new
		background: Color white;
		size: 900 asPoint;
		layout: (BlGridLayout new
			columnCount: 2;
			cellSpacing: 10).
			
	color := CAScale google20.
	titleShape := CALabelShape label
		attributes:
			{(BrFontSizeAttribute size: 20).
			(BrTextForegroundAttribute paint: Color black).
			BrFontWeightAttribute bold}.
	data keysDo: [ :k | 
		| b title |
		b := CAPieBuilder new
			objects: (data at: k);
			slice: #value.
		b shape
			externalRadius: 200;
			innerRadius: 100;
			background: [ :obj | color scale: obj key ];
			segmentSpacing: 0.5.
		b label 
			text: #key;
			rotated.
		b build.
		b root size: 400 asPoint.
		title := titleShape elementOn: k.
		title computeLayout.
		title relocate: 200 - title measuredBounds center.
		b elements@(CAPopup
			text: [ :obj |
				obj value asStringWithCommas , '$, ' ,
				(obj value * 100 / b totalSum) rounded asString, '%' ]).
		b root addChild: title.
		root addChild: b root ].
	
	^ root
]

{ #category : #'pie - examples' }
CABasicExamples >> example20PieAndLegend [
	
	<script: 'self new example20PieAndLegend inspect'>
	| root data color b title t1 t2 |
	root := BlElement new 
		background: (Color colorFrom: '#1a1b3a');
		size: 600@770.
	data := { 
		{ 'sleep'. 'I dream with my gf 8hrs'. 8 }.
		{ 'eat'. 'Sometimes I cook for 4hrs'. 3 }.
		{ 'work with smalltalk'. 'with Roassal & Carlone 8hrs'. 8 }.
		{ 'draw and play dota'. 'I draw with manga style and play dota in leyend level 4hrs'. 5} }.
		
	color := CAScale ordinal
		domain: data;
		range: ({ '#ae579c'. '#f28d1b'. '#e21454'. '#4cbcec' } collect: [ :c | Color colorFrom: c ]).
	b := CAPieBuilder new
		objects: data;
		slice: #third;
		centerGap: 100@20. "automatic in center?"
	b root: root.
	b shape
		externalRadius: 200;
		innerRadius: 140;
		background: color;
		segmentSpacing: 1.
	b label
		attributes: [ :obj | {
			BrTextForegroundAttribute paint: (color scale: obj).
			BrFontSizeAttribute size: 16.
			BrFontFamilyAttribute named: 'Helvetica'.} ];
		text: [ :obj | (obj third * 100 / b totalSum) rounded asString, '%' ].
	b label
		rotated;
		offset: 50. 
	b build.
	title := CALabelShape label
		attributes: [ :obj | {
			BrTextForegroundAttribute paint: Color white.
			BrFontSizeAttribute size: 30.
			BrFontFamilyAttribute named: 'Helvetica'.} ];
		text: #asUppercase.
		
	t1 := title elementOn: 'Milton'.
	t2 := title elementOn: 'Day'.
	t1 computeLayout.
	t2 computeLayout.
	t1 relocate: 300@200 - t1 measuredBounds center.
	t2 relocate: 300@240- t2 measuredBounds center.
	root addChild: t1; addChild: t2.
	
	b elements @ (CAPopup text: [:obj | obj first capitalized]).
	
	"lb := CALegendBuilder new.
	lb root background: Color transparent.
	root addChild: lb root.
	
	data do: [ :arr | 
		lb addRow: [ :row |
			row ellipse
				background: (color scale: arr).
			row title 
				text: arr first asUppercase;
				attributes: { BrTextForegroundAttribute paint: Color white }.
			row label
				text: arr second  ].
		 ]."
	
	^ root.
]

{ #category : #'pie - examples' }
CABasicExamples >> example21PiePyramid [
	
	<script: 'self new example21PiePyramid inspect'>
	| b data |
	data := { 
	{ 0.7. 'Sky'. Color lightBlue }.
	{0.2. 'Sunny side of pyramid'. Color yellow darker }.
	{ 0.05. 'Shady side of pyramid'. Color yellow muchDarker  } }.
	b := CAPieBuilder new.
	b 
		objects: data;
		slice: #first;
		start: -40.
	b shape interaction popupText: #second.
	b shape
		background: #third;
		externalRadius: 200.
	b build.
	^ b
]

{ #category : #'pie - examples' }
CABasicExamples >> example22Clockwise [
	
	<script: 'self new example22Clockwise inspect'>
	| b |
	b := self createPieBuilder2.
	b shape interaction popup.
	b start: -90.
	b shape
		onElement;
		background: CAScale category20;
		externalRadius: 200;
		alphaAngle: [ :e | (b outerAngleFor: e) negated ];
		betaAngle: [:e | (b innerAngleFor: e) negated ].
	b build.
	^ b
]

{ #category : #'pie - examples' }
CABasicExamples >> usaPopulation [
	| str |
	str := 'State,Under 5 Years,5 to 13 Years,14 to 17 Years,18 to 24 Years,25 to 44 Years,45 to 64 Years,65 Years and Over
AL,310504,552339,259034,450818,1231572,1215966,641667
AK,52083,85640,42153,74257,198724,183159,50277
AZ,515910,828669,362642,601943,1804762,1523681,862573
AR,202070,343207,157204,264160,754420,727124,407205
CA,2704659,4499890,2159981,3853788,10604510,8819342,4114496
CO,358280,587154,261701,466194,1464939,1290094,511094
CT,211637,403658,196918,325110,916955,968967,478007
DE,59319,99496,47414,84464,230183,230528,121688
DC,36352,50439,25225,75569,193557,140043,70648
FL,1140516,1938695,925060,1607297,4782119,4746856,3187797
GA,740521,1250460,557860,919876,2846985,2389018,981024
HI,87207,134025,64011,124834,356237,331817,190067
ID,121746,201192,89702,147606,406247,375173,182150
IL,894368,1558919,725973,1311479,3596343,3239173,1575308
IN,443089,780199,361393,605863,1724528,1647881,813839
IA,201321,345409,165883,306398,750505,788485,444554
KS,202529,342134,155822,293114,728166,713663,366706
KY,284601,493536,229927,381394,1179637,1134283,565867
LA,310716,542341,254916,471275,1162463,1128771,540314
ME,71459,133656,69752,112682,331809,397911,199187
MD,371787,651923,316873,543470,1556225,1513754,679565
MA,383568,701752,341713,665879,1782449,1751508,871098
MI,625526,1179503,585169,974480,2628322,2706100,1304322
MN,358471,606802,289371,507289,1416063,1391878,650519
MS,220813,371502,174405,305964,764203,730133,371598
MO,399450,690476,331543,560463,1569626,1554812,805235
MT,61114,106088,53156,95232,236297,278241,137312
NE,132092,215265,99638,186657,457177,451756,240847
NV,199175,325650,142976,212379,769913,653357,296717
NH,75297,144235,73826,119114,345109,388250,169978
NJ,557421,1011656,478505,769321,2379649,2335168,1150941
NM,148323,241326,112801,203097,517154,501604,260051
NY,1208495,2141490,1058031,1999120,5355235,5120254,2607672
NC,652823,1097890,492964,883397,2575603,2380685,1139052
ND,41896,67358,33794,82629,154913,166615,94276
OH,743750,1340492,646135,1081734,3019147,3083815,1570837
OK,266547,438926,200562,369916,957085,918688,490637
OR,243483,424167,199925,338162,1044056,1036269,503998
PA,737462,1345341,679201,1203944,3157759,3414001,1910571
RI,60934,111408,56198,114502,277779,282321,147646
SC,303024,517803,245400,438147,1193112,1186019,596295
SD,58566,94438,45305,82869,196738,210178,116100
TN,416334,725948,336312,550612,1719433,1646623,819626
TX,2027307,3277946,1420518,2454721,7017731,5656528,2472223
UT,268916,413034,167685,329585,772024,538978,246202
VT,32635,62538,33757,61679,155419,188593,86649
VA,522672,887525,413004,768475,2203286,2033550,940577
WA,433119,750274,357782,610378,1850983,1762811,783877
WV,105435,189649,91074,157989,470749,514505,285067
WI,362277,640286,311849,553914,1487457,1522038,750146
WY,38253,60890,29314,53980,137338,147279,65614'.
	^ str lines collect: [ :line |  line trimBoth splitOn: ',' ].
]
