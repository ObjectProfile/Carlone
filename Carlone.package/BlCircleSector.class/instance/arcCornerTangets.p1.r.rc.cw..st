utility
arcCornerTangets: p0 p1: p1 r: r1 rc: rc cw: cw
	| x01 y01 lo ox oy x1 y1 x2 y2 x3 y3 dx dy d2 r d D cx0 cy0 cx1 cy1 dx0 dy0 dx1 dy1 |
	x01 := p0 x - p1 x.
	y01 := p0 y - p1 y.
	lo := (cw ifTrue:[rc ] ifFalse: [ rc negated ]) / ((x01 * x01) + (y01*y01)) sqrt.
	ox := lo * y01.
	oy := lo negated * x01.
	x1 := p0 x + ox.
	y1 := p0 y + oy.
	x2 := p1 x + ox.
	y2 := p1 y + oy.
	x3 := (x1 + x2)/2.
	y3 := (y1 + y2)/2.
	dx := x2 - x1.
	dy := y2 - y1.
	d2 := (dx * dx) + (dy * dy).
	r := r1 - rc.
	D := (x1 * y2) - (x2 * y1).
	d := (dy < 0 ifTrue: [ -1 ] ifFalse: [ 1 ]) * (0 max: ((r*r *d2) - (D * D) ) ) sqrt.
	cx0 := ((D * dy) - (dx * d)) / d2.
	cy0 := ( (D negated * dx) - (dy * d) ) / d2.
	cx1 := ((D * dy) + (dx * d)) / d2.
	cy1 := ( (D negated * dx) + (dy * d) ) / d2.
	dx0 := cx0 - x3.
	dy0 := cy0 - y3.
	dx1 := cx1 - x3.
	dy1 := cy1 - y3.
	((dx0 * dx0) + (dy0 * dy0)) > ((dx1 * dx1) + (dy1 * dy1)) ifTrue: [ 
		cx0 := cx1.
		cy0 := cy1 ].
	^  (cx0 - ox)@ (cy0 - oy) negated -> ((cx0 * r1 / r)@(cy0 * r1/r) negated).


