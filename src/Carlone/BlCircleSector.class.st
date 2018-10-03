"
I am the defult arc for 
"
Class {
	#name : #BlCircleSector,
	#superclass : #BlGeometry,
	#instVars : [
		'alphaAngle',
		'betaAngle',
		'innerRadius',
		'externalRadius',
		'arcPadding',
		'cornerRadii'
	],
	#category : #'Carlone-Bloc'
}

{ #category : #accessing }
BlCircleSector >> alphaAngle [
	^ alphaAngle
]

{ #category : #accessing }
BlCircleSector >> alphaAngle: stAngle [
	alphaAngle := stAngle
]

{ #category : #utility }
BlCircleSector >> arcCornerTangets: p0 p1: p1 r: r1 rc: rc cw: cw [
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



]

{ #category : #utility }
BlCircleSector >> arcSweep: p1 and: p2 [
	^ ((p1 x - p2 x)* p1 y) - ((p1 y - p2 y) * p1 x) > 0
		ifTrue: [ 1 ] 
		ifFalse: [ 0 ]
]

{ #category : #utility }
BlCircleSector >> asin: x [
	^ x >= 1
	ifTrue: [ 1.5707963267948966 ]
	ifFalse: [ x <= -1
		ifTrue: [ -1.5707963267948966 ]
		ifFalse: [ x arcSin ] ].
	
]

{ #category : #accessing }
BlCircleSector >> betaAngle [
	^ betaAngle
]

{ #category : #accessing }
BlCircleSector >> betaAngle: ndAngle [
	betaAngle := ndAngle
]

{ #category : #sparta }
BlCircleSector >> buildPathOnSpartaCanvas: aCanvas [
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
]

{ #category : #accessing }
BlCircleSector >> centro: off [
	| r a |
	r := (innerRadius + externalRadius)/2 + off.
	a := ((alphaAngle + betaAngle) / 2) degreesToRadians.
	^ (a cos @ (a sin negated) * r)  + externalRadius.
]

{ #category : #accessing }
BlCircleSector >> cornerRadius [
	^ cornerRadii
]

{ #category : #accessing }
BlCircleSector >> cornerRadius: aNumber [
	self 
		assert: [ aNumber >= 0 ]
		description: 'Corner radius must be a non-negative!'.
	cornerRadii := aNumber "BlCornerRadii todo for future".  
]

{ #category : #accessing }
BlCircleSector >> externalRadius [
	^ externalRadius
]

{ #category : #accessing }
BlCircleSector >> externalRadius: eR [
	externalRadius := eR asFloat.
	self extent: (externalRadius * 2) asPoint.
]

{ #category : #utility }
BlCircleSector >> geomPolygonIntersectC: c d: d a: a b: b [

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
]

{ #category : #'geometry bounds' }
BlCircleSector >> geometryBounds: aBounds [

	^ aBounds
		origin: 0@0
		corner: extent
]

{ #category : #initialization }
BlCircleSector >> initialize [
	super initialize.
	cornerRadii := innerRadius := externalRadius := betaAngle := alphaAngle := arcPadding := 0.
	
]

{ #category : #accessing }
BlCircleSector >> innerRadius [
	^ innerRadius
]

{ #category : #accessing }
BlCircleSector >> innerRadius: iR [
	innerRadius := iR asFloat
]

{ #category : #geometry }
BlCircleSector >> matchExtent: anExtent [
	extent := anExtent
]

{ #category : #accessing }
BlCircleSector >> segmentSpacing [
	^ arcPadding
]

{ #category : #accessing }
BlCircleSector >> segmentSpacing: anAngleInDegrees [
	arcPadding := anAngleInDegrees.
]
