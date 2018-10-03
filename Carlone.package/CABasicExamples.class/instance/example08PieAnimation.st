pie - examples
example08PieAnimation
	<script: 'self new example08PieAnimation inspect'>
	| b |
	b := CAPieBuilder new.
	b objects: #(3 3 2 2 5 8 14).
	
	b shape
		innerRadius: 50;
		externalRadius: 200;
		border: (BlBorder builder paint: Color black; width: 1.5; build).
	b build.
	b root addAnimation: (BlNumberTransition new from: 0; to: 180; duration: 10 seconds; beInfinite;
		onStepDo: [ :t |
			b elements do: [ :el | | op |
				op := 125 - (t degreesToRadians sin abs * 125).
				el geometry 
					segmentSpacing: op;
					releaseCache ].
			b root invalidate ]).
	
	^ b