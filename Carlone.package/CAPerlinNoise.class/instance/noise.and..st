public
noise: xin and: yin
	"all this proces explained in http://webstaff.itn.liu.se/~stegu/simplexnoise/simplexnoise.pdf"
	| f2 s i j g2 t xzero yzero x0 y0 i1 j1 x1 y1 x2 y2 ii jj gi0 gi1 gi2 t0 n0 t1 n1 t2 n2 |
	f2 := 0.5 * (3 sqrt - 1).
	s := (xin + yin) * f2.
	i := (xin + s) floor.
	j := (yin + s) floor.
	g2 := (3 - 3 sqrt) / 6.
	t := (i + j) * g2.
	xzero := i - t.
	yzero := j - t.
	x0 := xin - xzero.
	y0 := yin - yzero.
	x0 > y0 ifTrue: [ 
		i1 := 1.
		j1 := 0 ]
		ifFalse: [ 
		i1 := 0.
		j1 := 1 ].
	x1 := x0 - i1 + g2.
	y1 := y0 - j1 + g2.
	x2 := x0 - 1 + (2* g2).
	y2 := y0 - 1 + (2* g2).
	
	ii := i & 255.
	jj := j & 255.
	
	gi0 := (self permAt: ii + (self permAt: jj)) % 12.
	gi1 := (self permAt: ii + i1 + (self permAt: jj + j1)) % 12.
	gi2 := (self permAt: ii + 1 + (self permAt: jj + 1) ) % 12.
	
	t0 := 0.5 - (x0 * x0) - (y0 * y0).
	t0 < 0 ifTrue: [ n0 := 0 ] ifFalse: [ 
		t0 := t0 * t0.
		n0 := t0 * t0 * (self dot: (self grad3At: gi0) and: x0 and: y0 ) ].
	t1 := 0.5 - (x1*x1) - (y1 * y1).
	t1 < 0 ifTrue: [ n1 := 0 ] ifFalse: [ 
		t1 := t1 * t1.
		n1 := t1 * t1 * (self dot: (self grad3At: gi1) and: x1 and: y1 ) ].
	t2 := 0.5 - (x2 * x2) - (y2 * y2).
	t2 < 0 ifTrue: [ n2 := 0 ] ifFalse: [ 
		t2 := t2 * t2.
		n2 := t2 * t2 * (self dot: (self grad3At: gi2) and: x2 and: y2) ].
	^ 70.0 * (n0 + n1 + n2).
	


