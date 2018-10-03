helpers
hex: v
	^ (v < 16 ifTrue: [ '0' ] ifFalse: [ '' ]), v printStringHex