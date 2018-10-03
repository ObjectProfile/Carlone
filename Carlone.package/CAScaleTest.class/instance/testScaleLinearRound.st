tests - linear
testScaleLinearRound
	| linear |
	linear := CAScale linear
		domain: #(-5 5);
		rangeRound: #(40 50).
	self 
		assert: (linear scale: 0.2) equals: 45;
		assert: (linear scale: 5.1) equals: 50;
		assert: (linear invert: 50) equals: 5;
		assert: (linear invert: 40) equals: -5
	