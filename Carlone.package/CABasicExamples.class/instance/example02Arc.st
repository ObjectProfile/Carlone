shapes  - examples
example02Arc
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