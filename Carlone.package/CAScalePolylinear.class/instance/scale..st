transformations
scale: x
	| j |
	j := self findJ: x.
	^ (i at: j) interpolate: ((u at: j) uninterpolate: x)
	