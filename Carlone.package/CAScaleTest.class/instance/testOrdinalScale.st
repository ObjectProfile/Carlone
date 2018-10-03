tests - scales
testOrdinalScale
	| ordinal |
	ordinal := CAScale ordinal
		domain: #('a' 'b' 'c' 'd' 'e' 'f');
		range: #(10 20 30 40 50 60).
	self 
		assert: (ordinal scale: 'a') equals: 10;
		assert: (ordinal scale: 'd') equals: 40;
		assert: (ordinal scale: 'f') equals: 60.
		