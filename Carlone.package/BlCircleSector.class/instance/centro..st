accessing
centro: off
	| r a |
	r := (innerRadius + externalRadius)/2 + off.
	a := ((alphaAngle + betaAngle) / 2) degreesToRadians.
	^ (a cos @ (a sin negated) * r)  + externalRadius.