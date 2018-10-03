utility
isModelCondition: aMessage
	| args |
	aMessage arguments size = 2 ifFalse: [ ^ false ].
	(aMessage selector beginsWith: #if:) ifFalse: [ ^ false ].
	args := Array
		with: [ :e | aMessage arguments first caValue: e caModel ]
		with: [ :e | aMessage arguments second caValue: e caModel ].
	self 
		perform: aMessage selector allButLast, #Element:
		withArguments: args.
	^ true