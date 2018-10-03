utility
geomPolygonIntersectC: c d: d a: a b: b

	| x1 x3 x21 x43 y1 y3 y21 y43 ua |
	x1 := c x.
	x3 := a x.
	x21 := d x - x1.
	x43 := b x - x3.
	y1 := c y.
	y3 := a y.
	y21 := d y - y1.
	y43 := b y - y3.
	ua := ((x43 *  (y1 - y3)) - (y43 * (x1 - x3))) / ((y43 * x21) - (x43 * y21 )).
	^ (x1 + (ua * x21))@
	(y1 +(ua * y21))