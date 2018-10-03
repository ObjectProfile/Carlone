polygon - examples
example03Stars
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
	