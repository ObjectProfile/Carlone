"
I can handle a several kind of values
"
Class {
	#name : #CAScalePolylinear,
	#superclass : #CAScale,
	#instVars : [
		'k',
		'u',
		'i'
	],
	#category : #'Carlone-Scales'
}

{ #category : #private }
CAScalePolylinear >> findJ: x [
	| lo hi mid |
	lo := 2.
	hi := k.
	[ lo < hi ] whileTrue: [ 
		mid := ((lo + hi) / 2) asInteger.
		(domain at: mid) > x 
			ifTrue: [ hi := mid ]
			ifFalse: [ lo := mid + 1 ] ].
	^ lo - 1 
]

{ #category : #transformations }
CAScalePolylinear >> rescale [
	u := OrderedCollection new.
	i := OrderedCollection new.
	k := domain size min: range size.
	(domain at: k) < domain first ifTrue: [
		domain := domain reverse.
		range := range reverse ].
	
	2 to: k do: [ :j | 
		u add: (uninterpolate uninterpolate: (domain at: j -1 ) and: (domain at: j)).
		i add: (interpolate interpolate: (range at: j -1) and: (range at: j) )
		 ].
	
	
]

{ #category : #transformations }
CAScalePolylinear >> scale: x [
	| j |
	j := self findJ: x.
	^ (i at: j) interpolate: ((u at: j) uninterpolate: x)
	
]
