tests - scales
testOrdinalScaleRangeRoundPoints
	| ordinal |
	ordinal := CAScale ordinal
		domain: #(1 2 3 4);
		rangeRoundPoints: #(0 100).
	self 
		assert: ordinal rangeBand equals: 0;
		assert: (ordinal scale: 1) equals: 0;
		assert: (ordinal scale: 2) equals: 33.333333333333333;
		assert: (ordinal scale: 4) equals: 100.
	