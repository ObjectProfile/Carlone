private
betaAngleFor: e
	values ifNil: [ self slice: #yourself ].
	^ ((values copyFrom: 1 to: (e caIndex) - 1), (Array with: 0)) sum * 360.0 / sum