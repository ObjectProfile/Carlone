private
alphaAngleFor: element
	| i |
	i := element userData at: #index.
	i isZero ifTrue: [ ^ 0 ].
	^ (values at: i) / sum * 360