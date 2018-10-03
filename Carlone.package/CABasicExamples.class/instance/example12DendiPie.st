pie - examples
example12DendiPie
	<script: 'self new example12DendiPie inspect'>
	| b |
	b := self createPieBuilder2.
	
	b shape
		innerRadius: 0;
		externalRadius: 200;
		border: (BlBorder builder paint: Color black; width: 1.5; build).
	b build.

	b elements doWithIndex: [ :e :i | | u alpha beta |
		alpha := e geometry alphaAngle.
		beta := e geometry betaAngle.
		u := [:t | 
			e geometry 
				alphaAngle: alpha * t;
				betaAngle: beta * t;
				releaseCache.
			e invalidate].
		e addAnimation: (BlSequentialAnimation new 
			add: (BlNumberTransition new from: 0; to: 1; duration: 1 seconds ;
				onStepDo: u;
				yourself );
			add: (BlNumberTransition new from: 0; to: 1; duration:  1 seconds;
				delay: 2 seconds;
				onStepDo: [:t |  
					e geometry 
						alphaAngle: alpha + ((360 - alpha) * t);
						betaAngle: beta + ((360 - beta)*t);
						releaseCache.
					e invalidate])).
	].
	^ b