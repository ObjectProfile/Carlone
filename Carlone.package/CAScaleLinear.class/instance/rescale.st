hooks
rescale
	| linear |
	linear := (domain size min: range size ) > 2
		ifTrue: [ CAScalePolylinear ]
		ifFalse: [ CAScaleBilinear ].
	uninterpolate := clamp
		ifTrue: [ CAUninterpolateClamp ]
		ifFalse: [ CAUninterpolateNumber ].
	output := linear new domain: domain; range: range; 
		uninterpolate: uninterpolate; interpolate: interpolate.
	output rescale.
	input := linear new domain: range; range: domain;
		uninterpolate: uninterpolate; interpolate: CAInterpolator.
	input rescale.