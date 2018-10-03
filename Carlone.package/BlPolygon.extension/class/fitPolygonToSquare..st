*Carlone
fitPolygonToSquare: points
	| maxx minx maxy miny sx sy x y |
	minx := maxx :=  points first x.
	miny := maxy :=  points first y.
	points do: [ :p | 
		minx := minx min: p x.
		miny := miny min: p y.
		maxx := maxx max: p x.
		maxy := maxy max: p y ].
	"stretch factors"
	sx := 2/(maxx - minx).
	sy := 2/(maxy - miny).
	points doWithIndex: [ :p :i|
		x := p x * sx.
		y := p y * sy.
		points at: i put: x@y.
		minx := minx min: x.
		miny := miny min: y.
		maxx := maxx max: x.
		maxy := maxy max: y ].
	miny < -1 ifTrue: [ 
		points doWithIndex: [ :p :i |
			points at: i put: p x @ ( p y - 1 - miny ) ] ].
	^ points.