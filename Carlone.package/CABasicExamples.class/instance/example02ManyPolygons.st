polygon - examples
example02ManyPolygons
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