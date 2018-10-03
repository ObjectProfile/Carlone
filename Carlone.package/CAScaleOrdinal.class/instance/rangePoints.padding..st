public
rangePoints: x padding: padding
	| start stop step |
	start := x first.
	stop := x second.
	step := domain size < 2
		ifTrue: [ start := (start  + stop)/2. 0 ]
		ifFalse: [ (stop - start)/(domain size - 1 + padding) ].
	range := self 
		steps: start + (step * padding / 2)
		and: step.
	rangeBand := 0.
	
	ranger := #rangePoints:padding:.
	argument := Array with: x with: padding