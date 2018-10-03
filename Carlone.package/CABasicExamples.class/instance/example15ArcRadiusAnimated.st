pie - examples
example15ArcRadiusAnimated
	<script: 'self new example15ArcRadiusAnimated inspect'>
	| b b2 data iradius eradius |
	
	data := #(1 1 2 3 5 8 13 21).
	b := CAPieBuilder new.
	b objects: data.
	iradius := 70.
	eradius := 220.
	b shape
		innerRadius: iradius;
		externalRadius: eradius;
		background: Color transparent;
		border: (BlBorder builder paint: Color lightGray; width: 1.5; build);
		segmentSpacing: 1.
	b build.
	
	b2 := CAPieBuilder new.
	b2 objects: data.
	b2 root: b root.
	
	b2 shape 
		innerRadius: iradius;
		externalRadius: eradius;
		border: (BlBorder builder paint: Color black; width: 1.5; build);
		segmentSpacing: 1.
	b2 build.
	b2 root addAnimation: (BlNumberTransition new
		beInfinite; duration: 2 seconds;
		from: 0; to: 1;
		onStepDo: [:k |
			b2 elements do: [:el | | t |
				t := 1 - ((k - 0.5) abs * 2).
				el geometry 
					cornerRadius: (eradius - iradius )/2 * t;
					releaseCache.
				el invalidate.
				 ] ]).
	^ b