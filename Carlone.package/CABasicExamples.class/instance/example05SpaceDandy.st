shapes  - examples
example05SpaceDandy
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
	