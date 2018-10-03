shapes  - examples
example01Ellipse
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