tests - scales
testOrdinalScaleRangePoints
	| ordinal |
	ordinal := CAScale ordinal
		domain: #('apple' 'orange' 'banana' 'grape');
		rangePoints: #(0 960).
	self 
		assert: (ordinal scale: 'apple') equals: 0;
		assert: (ordinal scale: 'orange') equals: 320;
		assert: (ordinal scale: 'grape') equals: 960;
		
		assert: ordinal rangeExtent equals: #(0 960)
	
		