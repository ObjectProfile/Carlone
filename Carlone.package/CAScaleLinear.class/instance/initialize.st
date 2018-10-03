initialization
initialize
	super initialize.
	range := domain := #(0 1).
	clamp := false.
	interpolate := CAInterpolator.
	self rescale.