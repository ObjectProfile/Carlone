polygon - examples
example01CircleWaves
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