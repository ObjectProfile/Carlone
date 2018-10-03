tests - linear
testScaleLinearClamp
	| linear |
	linear := CAScale linear
		domain: #(0 10);
		range: #(0 100).
	self assert: (linear scale: 11) equals: 110.
	self assert: (linear scale: -5) equals: -50.
	linear clamp: true.
	self assert: (linear scale: 11) equals: 100.
	self assert: (linear scale: -5) equals: 0.