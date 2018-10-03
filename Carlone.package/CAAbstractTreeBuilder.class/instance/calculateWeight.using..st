private
calculateWeight: e using: block
	| w children |
	(e userData includesKey: #weight) 
		ifTrue: [ ^ e userData at: #weight ].
	
	children := e userData at: #children.
	
	children 
		ifEmpty: [ w := block caValue: e caModel ]
		ifNotEmpty: [ 
			w := children
				inject: 0 
				into: [ :s :el | s + (self calculateWeight: el using: block) ] ].
	w := w max: 1.
	e userData at: #weight put: w.
	^ w