tests - scales
testLogScale
	| log |
	log := CAScale log.
	self 
		assert: log base equals: 10;
		assert: log range equals: #(0 1);
		assert: (log scale: 10) equals: 1;
		assert: (log scale: 100) equals: 2;
		assert: (log scale: 50) equals: 1.6989700043360185.
	log := CAScale log
		base: Float e;
		domain: (#(0 9) collect: #exp);
		range: #(200 0).
	self assert: ((log scale: 50) closeTo: 113.06615543493011).
	self assert: ((log scale: 0.01) closeTo: 302.3371152441798).
	self assert: ((log scale: 100) closeTo: 97.66288475582019).
	self assert: ((log invert: 10) closeTo: 5166.754427175983).
	
	self assert: (log scale: 9000) closeTo: -2.3328856959635047.
	log clamp: true.
	self
		assert: (log scale: 9000) closeTo: 0;
		assert: log interpolate equals: CAInterpolator.
	log interpolate: CAInterpolator
	
