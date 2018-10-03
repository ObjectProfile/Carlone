tests - scales
testOrdinalScaleRangeBands
	| ordinal |
	ordinal := CAScale ordinal
		domain: #('a' 'b' 'c' 'd' 'e' 'f');
		rangeBands: #(0 960).
	self 
		assert: ordinal rangeBand equals: 160;
		assert: (ordinal scale: 'a') equals: 0;
		assert: (ordinal scale: 'd') equals: 480;
		assert: (ordinal scale: 'f') equals: 800;
		
		assert: ordinal rangeExtent equals: #(0 960)
		