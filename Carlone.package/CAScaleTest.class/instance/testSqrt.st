tests - scales
testSqrt
	| sqrt |
	sqrt := CAScale sqrt.
	self 
		assert: sqrt exponent equals: 0.5;
		assert: ((sqrt scale: 9) closeTo: 3).
	
	sqrt := CAScale sqrt
		domain: #(0 36756666);
		range: #(0 220).
	self assert: (sqrt scale: 4661900) closeTo: 78.34947695663722
	