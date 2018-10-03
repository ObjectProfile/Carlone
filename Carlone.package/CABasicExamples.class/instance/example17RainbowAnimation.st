pie - examples
example17RainbowAnimation

	<script: 'self new example17RainbowAnimation inspect'>
	| builder time n d eradius |
	n := 48.
	d := 100.
	time := DateAndTime now.
	builder := CAPieBuilder new
		objects: (1 to: n);
		slice: [ :v | 1 ];
		arcRadiusAuto;
		yourself.
	builder root size: 800@800.
	eradius := [ :e | | t |
		t := (DateAndTime now - time) asMilliSeconds / 1000.0.
		300 +( (t +  ((e caModel /n) * Float pi * 4)) sin * d ) ].
	builder shape
		externalRadius: eradius;
		onModel;
		segmentSpacing: 1;
		innerRadius: 75;
		background: [ :i | | f r g b |
			f := (i / n) * Float pi * 2.
			r := (f + 0) sin * 127 + 128.
			g := (f + 2) sin * 127 + 128.
			b := (f + 4) sin * 127 + 128.
			Color r: r g: g b: b range: 256 ].
	builder root addAnimation: (BlNumberTransition new
		beInfinite; duration: 2 seconds; from: 0; to: 1;
		onStepDo: [:k| 
			builder elements do: [ :e | | r |
				r := eradius caValue: e.
				e geometry 
					externalRadius: r;
					releaseCache.
				e size: r * 2 asPoint.
				e relocate: 400 - r asPoint.
				 ].
			builder root invalidate.
			]).
	builder build.
	^ builder