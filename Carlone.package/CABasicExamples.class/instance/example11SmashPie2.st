pie - examples
example11SmashPie2
	<script: 'self new example11SmashPie2 inspect'>
	| b r |
	r := SharedRandom globalGenerator.
	b := CAPieBuilder new.
	b objects: ((1 to: 360) collect: [:e | r next]) sort.
	
	b shape
		onElement;
		innerRadius: 0;
		externalRadius: 200;
		alphaAngle: [:e | e caIndex - 1 ];
		betaAngle: [ :e | e caIndex + 1 ];
		background: [:e | Color h: e caIndex s: 1 l: 0.5].
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
			add: (BlNumberTransition new from: 0; to: 1; duration: 2 seconds;
				delay: (10 * i) milliSeconds;
				easing: (BlEasingElastic2 new elasticity: -1 and: 0.30) ;
				onStepDo: u2 )).
	].
	^ b