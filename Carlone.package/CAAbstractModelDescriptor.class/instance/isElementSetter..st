utility
isElementSetter: aMessage
	| sel |
	aMessage arguments size = 1 ifFalse: [ ^ false ].
	(aMessage selector endsWith: #Element:) ifFalse: [ ^ false ].
	sel := (aMessage selector allButLast: 8), ':'.
	self privateSet: sel with: aMessage arguments.
	^ true