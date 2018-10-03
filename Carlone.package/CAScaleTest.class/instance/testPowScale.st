tests - scales
testPowScale
	| pow |
	pow := CAScale pow.
	
	self
		assert: pow exponent equals: 1;
		assert: (pow scale: 5) equals: 5.
	pow exponent: 2.
	self
		assert: (pow scale: 5) equals: 25;
		assert: (pow invert: 25) equals: 5;
		assert: pow exponent equals: 2.
	
	pow 
		domain: #(0 100);
		range: #(-10 10);
		clamp: true.
		
	self 
		assert: (pow scale: 200) equals: 10;
		assert: (pow scale: 99.9) closeTo: 9.960020000000004.
	pow interpolate: CARoundInterpolator.
	self 
		assert: pow interpolate equals: CARoundInterpolator;
		assert: (pow scale: 99.9) equals: 10;
		assert: pow range equals: #(-10 10)