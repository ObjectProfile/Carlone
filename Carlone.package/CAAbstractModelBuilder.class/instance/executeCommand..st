reflective operations
executeCommand: name
	
	| res |
	res := nil.
	self commands 
		select: [ :cmd | cmd selector = name ]
		thenDo: [ :cmd | res := cmd execute ].
	^ res