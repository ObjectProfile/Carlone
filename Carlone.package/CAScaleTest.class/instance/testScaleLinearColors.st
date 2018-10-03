tests - linear
testScaleLinearColors
	| linear |
	linear := CAScale linear
		domain: #(0 100);
		range: #('white' 'black').
	self assert: (linear scale: 50) equals: Color gray.
	self assert: (linear scale: 0) equals: Color white.
	self assert: (linear scale: 100) equals: Color black.	