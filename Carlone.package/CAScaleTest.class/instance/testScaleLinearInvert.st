tests - linear
testScaleLinearInvert
	| linear |
	linear := CAScale linear
		domain: #(-5 5);
		range: #(40 50).
	self 
		assert: (linear scale: 0) equals: 45;
		assert: (linear scale: 5) equals: 50;
		assert: (linear invert: 50) equals: 5;
		assert: (linear invert: 40) equals: -5
	