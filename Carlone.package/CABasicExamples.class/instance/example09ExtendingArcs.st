pie - examples
example09ExtendingArcs
	<script: 'self new example09ExtendingArcs inspect'>
	| b eRadius |
	b := self createPieBuilder2.
	eRadius := 200.
	b shape
		innerRadius: 50;
		externalRadius: eRadius;
		background: Color lightGray;
		border: (BlBorder builder paint: Color black; width: 1.5; build);
		segmentSpacing: 1.
	b centerGap: 50@50.
	b build.

	b elements do: [ :e | | update |
		update := [ :t | 
			e geometry externalRadius: t; releaseCache.
			e size: t * 2 asPoint.
			e relocate: b centerGap - t + eRadius.
			b root invalidate. ].
		e 
			when: BlMouseOverEvent do: [ :evt | 
				e addAnimation: (BlNumberTransition new from: 200; to: 220; 
					duration: 0.2 seconds; onStepDo: update)];
			when: BlMouseOutEvent do: [ :evt | 
				e addAnimation: (BlNumberTransition new from: 220; to: 200; 
					duration: 0.2 seconds; onStepDo: update) ];
			when: BlMouseDownEvent do: [ :evt |
					e background: Color random ] ].
	^ b