Extension { #name : #BlPolygon }

{ #category : #'*Carlone' }
BlPolygon class >> fitPolygonToSquare: points [
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
]

{ #category : #'*Carlone' }
BlPolygon class >> generatePointsFitSquare: sides [
	| points |
	points := self generateUnitNgonPoints: sides rotation: 0.
	points := self fitPolygonToSquare: points.
	points doWithIndex: [ :p :i |
		points at: i put: p+1 ].
	^ points
]

{ #category : #'*Carlone' }
BlPolygon class >> generateUnitNgonPoints: sides rotation: rotationAngle [
	
	^ self generateUnitNgonPoints: sides  rotation: rotationAngle
		angle: [ :a :i | a negated ] 
		radius: [ :a :i | 1 ]
]

{ #category : #'*Carlone' }
BlPolygon class >> generateUnitNgonPoints: sides rotation: rotationAngle angle: angleBloc radius: radiusBloc [
	"sides a Number
	rotation is a number in radians
	angle is a function of 2 args(current angle and index of angle) this return an angle
	radius is a function of 2 args (current angle and index of angle) this retunr a number "
	| increment startAngle points currentAngle currentRadius |
	increment := 1.0 / sides * 2 * Float pi.
	startAngle := sides even
		ifTrue: [ (Float pi / 2) + (increment / 2) ]
		ifFalse: [ Float pi / 2 ].
	startAngle := startAngle + rotationAngle.
	points := Array new: sides.
	0 to: sides - 1 do: [ :i | 
		currentAngle := i * increment + startAngle.
		currentAngle := angleBloc value: currentAngle value: i.
		currentRadius := radiusBloc value: currentAngle value: i.
		points at: i+1 put: (currentAngle cos @ currentAngle sin) * currentRadius ].
	^ points
]

{ #category : #'*Carlone' }
BlPolygon >> geometryExtent: newExtent [
	| min max sx sy |
	
	min := vertices min.
	max := vertices max.
	sx := newExtent x / (max x - min x).
	sy := newExtent y / (max y - min y).
	vertices doWithIndex: [ :p :i |
		vertices at: i put: (p x * sx)@(p y * sy)].
	extent := newExtent.
]
