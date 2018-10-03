transformations
scale: x
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