tests - scales
testOrdinalScaleRangeRoundBands
	| ordinal |
	ordinal := CAScale ordinal
		domain: #('a' 'b' 'c' 'd' 'e' 'f');
		rangeRoundBands: #(0 960) padding: 0.1.
	self 
		assert: ordinal rangeBand equals: 141;
		assert: (ordinal scale: 'a') equals: 17;
		assert: (ordinal scale: 'd') equals: 488;
		assert: (ordinal scale: 'f') equals: 802;
		assert: ordinal rangeExtent equals: #(0 960).
		
	ordinal := CAScale ordinal
		domain: #('a' 'b' 'c' 'd' 'e' 'f');
		rangeRoundBands: #(0 960).
	self 
		assert: ordinal rangeBand equals: 160;
		assert: (ordinal scale: 'a') equals: 0;
		assert: (ordinal scale: 'd') equals: 480;
		assert: (ordinal scale: 'f') equals: 800;
		assert: ordinal rangeExtent equals: #(0 960)