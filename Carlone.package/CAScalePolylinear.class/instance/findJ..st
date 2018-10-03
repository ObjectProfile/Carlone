private
findJ: x
	| lo hi mid |
	lo := 2.
	hi := k.
	[ lo < hi ] whileTrue: [ 
		mid := ((lo + hi) / 2) asInteger.
		(domain at: mid) > x 
			ifTrue: [ hi := mid ]
			ifFalse: [ lo := mid + 1 ] ].
	^ lo - 1 