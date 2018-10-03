tests - linear
testScaleLinear
	| linear |
	linear := CAScale linear.
	self 
		assert: linear domain equals: #(0 1);
		assert: linear range equals: #(0 1).
	linear range: #(1 10).
	self
		assert: (linear scale: 1) equals: 10;
		assert: (linear scale: 0.5) equals: 5.5.
		
	self assert: linear interpolate equals: CAInterpolator.
	self assert: linear uninterpolate equals: CAUninterpolateNumber.
	
	