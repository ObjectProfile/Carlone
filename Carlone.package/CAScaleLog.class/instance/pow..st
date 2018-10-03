math functions
pow: x
	^ positive  
		ifTrue: [ base raisedTo: x ]
		ifFalse: [ (base raisedTo: x negated) negated ].
		