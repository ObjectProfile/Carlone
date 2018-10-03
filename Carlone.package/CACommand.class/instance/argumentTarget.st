accessing - computed
argumentTarget
	^ self isForModel
		ifTrue: [ element caModel ]
		ifFalse: [ element ]