polygon - examples
example04AnimatedStar
	<script: 'self new example04AnimatedStar inspect'>
	| root extent iradius star e |
	root := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent. 
			c vertical matchParent ];
		yourself.
	extent := 200 asPoint.
	iradius := CAScale linear 
		domain: #(0 0.5 1);
		range: #(0.05 0.9 0.05).
	star := CAGeometryBuilder star
		background: (BlLinearGradientPaint  new
			stops: {
				0 -> Color blue.
				1 -> Color green};
			start: 0@0;
			end: extent);
		rotation: 0;
		geometryExtent: extent;
		border: (BlBorder paint: Color black);
		effect: (BlDropShadowEffect color: Color veryLightGray width: 30 offset: 20@20).
	root addChild: (e := star element).
	root addAnimation: (BlNumberTransition new 
		from: 0; to: 1; beInfinite; duration: 2 second;
		onStepDo: [ :t |
			e geometry 
				innerRadius: (iradius scale: t);
				releaseCache.
			e invalidate]). 
	^ root.