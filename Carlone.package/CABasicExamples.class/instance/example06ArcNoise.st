shapes  - examples
example06ArcNoise
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