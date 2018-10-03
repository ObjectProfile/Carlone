public
rangeRoundPoints: x padding: padding
	| start stop step |
	start := x first.
	stop := x second.
	step := domain size < 2
		ifTrue: [ start := stop := ((start + stop)/2) rounded. 0 ]
		ifFalse: [[ (stop - start)/(domain size -1 + padding)]
			on: Error do: [ :ex | 0 ] ].
		
	range := self 
		steps: start + ((step * padding / 2) + (stop - start - 
			((domain size - 1 + padding)* step) )/ 2) rounded
		and: step.
	rangeBand := 0.
	ranger := #rangeRoundPoints:padding:.
	argument := Array with: x with: padding