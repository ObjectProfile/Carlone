shapes  - examples
example03ArcCarlone
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