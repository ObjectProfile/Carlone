shapes  - examples
example04YoviRetina
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
	