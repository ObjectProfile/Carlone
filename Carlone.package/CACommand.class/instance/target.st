accessing - computed
target
	^ (element class canUnderstand: message selector) 
		ifTrue: [ element ]
		ifFalse: [ component ]