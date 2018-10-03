"
I am a scale for ordinal ranges
"
Class {
	#name : #CAScaleOrdinal,
	#superclass : #CAScale,
	#instVars : [
		'ranger',
		'dictionary',
		'argument',
		'rangeBand'
	],
	#category : #'Carlone-Scales'
}

{ #category : #accessing }
CAScaleOrdinal >> domain: arr [
	domain := OrderedCollection new.
	dictionary := Dictionary new.
	arr do: [ :xi |
		(dictionary includes: xi) ifFalse: [ 
			domain add: xi.
			dictionary at: xi put: domain size ] ].
	self perform: ranger withArguments: argument
]

{ #category : #initialization }
CAScaleOrdinal >> initialize [
	super initialize.
	ranger := #range:.
	argument := #( #() ).
	self domain: #().
	
	
]

{ #category : #accessing }
CAScaleOrdinal >> range: x [
	range := x.
	rangeBand := 0.
	ranger := #range:.
	argument := Array with: x.
]

{ #category : #accessing }
CAScaleOrdinal >> rangeBand [
	^ rangeBand
]

{ #category : #public }
CAScaleOrdinal >> rangeBands: x [
	self rangeBands: x padding: 0
]

{ #category : #public }
CAScaleOrdinal >> rangeBands: x padding: padding [
	self rangeBands: x padding: padding outerPadding: padding
]

{ #category : #public }
CAScaleOrdinal >> rangeBands: x padding: padding outerPadding: outerPadding [
	| start stop step reverse |
	start := x first.
	stop := x second.
	reverse := false.
	start > stop ifTrue: [| t |
		t := start. start := stop. stop := t.
		reverse := true. ].
	step := (stop - start) / (domain size - padding + (2*outerPadding)).
	
	range := self 
		steps: start + (step * outerPadding)
		and: step.
	reverse ifTrue: [ range := range reverse ].
	rangeBand := step * (1 - padding).
	ranger := #rangeBands:padding:outerPadding:.
	argument := Array with: x with: padding with: outerPadding
]

{ #category : #accessing }
CAScaleOrdinal >> rangeExtent [
	^ self scaleExtent: argument first
]

{ #category : #accessing }
CAScaleOrdinal >> rangeFrom: array [
	self range: (array collect: [ :val | Color colorFrom: val ])
]

{ #category : #public }
CAScaleOrdinal >> rangePoints: x [
	self rangePoints: x padding: 0
]

{ #category : #public }
CAScaleOrdinal >> rangePoints: x padding: padding [
	| start stop step |
	start := x first.
	stop := x second.
	step := domain size < 2
		ifTrue: [ start := (start  + stop)/2. 0 ]
		ifFalse: [ (stop - start)/(domain size - 1 + padding) ].
	range := self 
		steps: start + (step * padding / 2)
		and: step.
	rangeBand := 0.
	
	ranger := #rangePoints:padding:.
	argument := Array with: x with: padding
]

{ #category : #public }
CAScaleOrdinal >> rangeRoundBands: x [
	self rangeRoundBands: x padding: 0
]

{ #category : #public }
CAScaleOrdinal >> rangeRoundBands: x padding: padding [
	self rangeRoundBands: x padding: padding outerPadding: padding
]

{ #category : #public }
CAScaleOrdinal >> rangeRoundBands: x padding: padding outerPadding: outerPadding [
	| start stop step reverse |
	start := x first.
	stop := x second.
	reverse := false.
	start > stop ifTrue: [| t |
		t := start. start := stop. stop := t.
		reverse := true. ].
	step := ((stop - start) / (domain size - padding + (2*outerPadding))) floor.
	
	range := self 
		steps: start + ( (stop - start - ((domain size - padding) * step) ) / 2 ) rounded
		and: step.
	reverse ifTrue: [ range := range reverse ].
	rangeBand := (step * (1 - padding)) rounded.
	ranger := #rangeRoundBands:padding:outerPadding:.
	argument := Array with: x with: padding with: outerPadding
]

{ #category : #public }
CAScaleOrdinal >> rangeRoundPoints: x [
	self rangeRoundPoints: x padding: 0
]

{ #category : #public }
CAScaleOrdinal >> rangeRoundPoints: x padding: padding [
	| start stop step |
	start := x first.
	stop := x second.
	step := domain size < 2
		ifTrue: [ start := stop := ((start + stop)/2) rounded. 0 ]
		ifFalse: [[ (stop - start)/(domain size -1 + padding)]
			on: Error do: [ :ex | 0 ] ].
		
	range := self 
		steps: start + ((step * padding / 2) + (stop - start - 
			((domain size - 1 + padding)* step) )/ 2) rounded
		and: step.
	rangeBand := 0.
	ranger := #rangeRoundPoints:padding:.
	argument := Array with: x with: padding
]

{ #category : #transformations }
CAScaleOrdinal >> scale: x [
	| index |
	index := dictionary at: x ifAbsent: [ nil ].
	(index isNil and: [ ranger = #range:]) ifTrue: [
		domain add: x.
		dictionary at: x put: (index := domain size).
		].
	index ifNil: [ self error: 'invalid input' ].
	index := index % range size.
	index isZero 
		ifTrue: [ index := range size ].
	^ range at: index
]

{ #category : #helpers }
CAScaleOrdinal >> scaleExtent: d [
	| start stop |
	start := d first.
	stop := d last.
	^ start < stop
		ifTrue: [ Array with: start with: stop ]
		ifFalse: [ Array with: stop with: start ]
]

{ #category : #helpers }
CAScaleOrdinal >> steps: start and: step [
	^ (0 to: domain size - 1) collect: [ :i | (start + (step * i)) asFloat ].
]
