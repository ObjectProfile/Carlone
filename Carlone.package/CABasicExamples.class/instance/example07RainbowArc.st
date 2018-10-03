shapes  - examples
example07RainbowArc
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