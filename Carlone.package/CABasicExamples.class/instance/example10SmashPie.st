pie - examples
example10SmashPie
	<script: 'self new example10SmashPie inspect'>
	| b |
	b := self createPieBuilder2.
	
	b shape
		innerRadius: 0;
		externalRadius: 200;
		cornerRadius: 10;
		border: (BlBorder builder paint: Color black; width: 1.5; build).
	b build.

	b elements doWithIndex: [ :e :i | | u1 u2 |
		e userData 
			at: #a put: e geometry alphaAngle;
			at: #b put: e geometry betaAngle.
		u1 := [:t | 
			e geometry 
				alphaAngle: (e userData at: #a) * t;
				betaAngle: (e userData at: #b)* t;
				releaseCache.
			e invalidate].
		u2 := [:t | 
			e geometry 
				innerRadius: 120*t;
				releaseCache.
			e invalidate].
		e addAnimation: (BlSequentialAnimation new 
			add: (BlNumberTransition new from: 0; to: 1; duration: 2 seconds;
				easing: BlEasing bounceOut;
				onStepDo: u1;
				yourself );
			add: (BlNumberTransition new from: 0; to: 1; duration: 750 milliSeconds;
				delay: (50 * i) milliSeconds;
				easing: (BlEasingElastic2 new) ;
				onStepDo: u2 )).
	].
	^ b