public
rangeBands: x padding: padding outerPadding: outerPadding
	| start stop step reverse |
	start := x first.
	stop := x second.
	reverse := false.
	start > stop ifTrue: [| t |
		t := start. start := stop. stop := t.
		reverse := true. ].
	step := (stop - start) / (domain size - padding + (2*outerPadding)).
	
	range := self 
		steps: start + (step * outerPadding)
		and: step.
	reverse ifTrue: [ range := range reverse ].
	rangeBand := step * (1 - padding).
	ranger := #rangeBands:padding:outerPadding:.
	argument := Array with: x with: padding with: outerPadding