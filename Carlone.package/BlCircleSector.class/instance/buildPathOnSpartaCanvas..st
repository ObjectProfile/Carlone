sparta
buildPathOnSpartaCanvas: aCanvas
	| pathBuilder aAngle bAngle xAngle i e center ap epsilon aAngle2 bAngle2 rp da da0 da1 xCos xSin rc x1 x2 x3 x4 y1 y2 y3 y4 rc0 rc1 t41 t23  t14 t32 |
	epsilon := 1e-12.
	ap := (arcPadding / 2) degreesToRadians.
	aAngle := alphaAngle degreesToRadians.
	bAngle := betaAngle degreesToRadians.
	da := da0 := da1 := (aAngle - bAngle) abs.
	aAngle2 := aAngle.
	bAngle2 := bAngle.
	center := extent/2.
	i := innerRadius asFloat.
	e := externalRadius.
	"is it a point? "
	pathBuilder := (aCanvas path:#evenodd)absolute.
	e < epsilon ifTrue: [ ^ pathBuilder moveTo: center; finish ].
	
	"or is a circle? "
	da0 > (Float pi * 2 - epsilon) ifTrue: [ 
		pathBuilder 
			moveTo: ((e * aAngle cos)@( e * aAngle sin negated)) + center ;
			arcAround: center radius: e startAngle: aAngle endAngle: bAngle.
		i > epsilon ifTrue: [ 
			pathBuilder
				moveTo: ((i * aAngle cos)@( i * aAngle sin negated)) + center ;
				arcAround: center radius: i startAngle: aAngle endAngle: bAngle ].
		pathBuilder close.
		^ pathBuilder finish. ]. 
	"circle part"
	xAngle := (aAngle + bAngle)/2.
	rp := ((i*i) + (e*e)) sqrt.
	"apply padding"
	rp > epsilon ifTrue: [ | p0 p1 |
		p0 := i isZero 
			ifTrue: [ self asin: Float infinity ]
			ifFalse: [ self asin: (rp / i * ap sin) ].
		p1 := self asin: (rp / e * ap sin).
		da0 := da0 - (p0*2).
		da0 > epsilon
			ifTrue: [ aAngle2 := aAngle2 + p0. bAngle2 := bAngle - p0 ] 	
			ifFalse: [ aAngle2 := bAngle2 := (aAngle + bAngle)/2. ].
		da1 := da1 - (p1*2).
		da1 > epsilon
			ifTrue: [ aAngle := aAngle + p1. bAngle := bAngle - p1 ]
			ifFalse: [ aAngle := bAngle := xAngle] ].
	xCos := xAngle cos.
	xSin := xAngle sin.
	
	x1 := e*aAngle cos.
	y1 := e*aAngle sin.
	x2 := e*bAngle cos.
	y2 := e*bAngle sin.
	x4 := i*aAngle2 cos.
	y4 := i*aAngle2 sin.
	x3 := i*bAngle2 cos.
	y3 := i*bAngle2 sin.
	
	"is it small circle part?"
	(aAngle - bAngle) abs < 0.001 ifTrue: [ 
		^ pathBuilder 
			moveTo: (x3@y3) + center;
			lineTo: (x2@y2) + center;
			close; finish].
	"apply corner radius"
	rc := ((i -e) abs /2) min: self cornerRadius.
	rc0 := rc1 := rc.
	(da > epsilon and: [ rc > 0.001 ]) ifTrue: [ 	
		da < Float pi ifTrue: [ 
			| oc ax ay bx by kc lc |
			oc := self geomPolygonIntersectC: x1@y1 d: x4@y4 a: x2@y2  b: x3@y3.
			ax := x1 - oc x.
			ay := y1 - oc y.
			bx := x2 - oc x.
			by := y2 - oc y.
			kc := 1 / (( ((ax*bx) + (ay*by)) /  ( ((ax*ax)+ (ay*ay)) sqrt * ( (bx*bx)+(by*by) ) sqrt ) ) arcCos / 2) sin.
			lc := ((oc x * oc x) + (oc y*oc y)) sqrt.
			rc0 := rc0 min: ((e - lc) / (kc + 1)).
			rc1 := rc1 min: ((i - lc) / (kc - 1)).
			].
		].

	t41 := self arcCornerTangets: x4@y4 p1: x1@y1 r: e rc: rc0 cw: true.
	t23 := self arcCornerTangets: x2@y2 p1: x3@y3 r: e rc: rc0 cw: true.
	pathBuilder moveTo: t41 key + center.
	rc0 == rc ifTrue: [ 
		pathBuilder 
			ellipticalArc2: rc0@rc0 
				xrot: 0
				large: 0
				sweep: 0
				to: t41 value + center;
			ellipticalArc2: e@e
				xrot: 0
				large: (self arcSweep: t41 value and: t23 value)
				sweep: 0
				to: t23 value + center;
			ellipticalArc2: rc0@rc0
				xrot: 0
				large: 0
				sweep: 0
				to: t23 key + center.
			 ]
	ifFalse: [ 
		pathBuilder 
			ellipticalArc2: rc0@rc0 
				xrot: 0 
				large: 1 
				sweep: 0
				to: t23 key + center ].
	
	x4 isZero ifTrue: [ 
		pathBuilder lineTo: center. ]
	ifFalse: [ 
		t14 := self arcCornerTangets: x1@y1 p1: x4@y4 r: i rc: rc1 negated cw: true.
		t32 := self arcCornerTangets: x3@y3 p1: x2@y2 r: i rc: rc1 negated cw: true.
		pathBuilder lineTo: t32 key + center.
		(rc == rc1 and: [da0 > 0 ]) ifTrue: [ 
			pathBuilder 
				ellipticalArc2: rc1@ rc1
					xrot: 0
					large: 0
					sweep: 0
					to: t32 value + center;
				ellipticalArc2: i@i
					xrot: 0
					large: (self arcSweep: t14 value and: t32 value) 
					sweep: 1
					to: t14 value + center;
				ellipticalArc2: rc1@rc1
					xrot: 0
					large: 0
					sweep: 0
					to: t14 key + center
		] ifFalse: [ 
			pathBuilder 
				ellipticalArc2: rc1@ rc1
					xrot: 0
					large: 0
					sweep: 0
					to: t14 key + center
	 	] ] .
	^ pathBuilder close finish.