utility
isElementCondition: aMessage
	| args sel old |
	aMessage arguments size = 2 ifFalse: [ ^ false ].
	(aMessage selector beginsWith: #if:) ifFalse: [ ^ false ].
	(aMessage selector endsWith: #Element:) ifFalse: [ ^ false ].
	sel := aMessage selector copyFrom: 4 to: aMessage selector size - 8.
	old := self globalAttributeAt: sel, ':'.
	old ifNil: [ self error: 'Use ', sel, ' first'. ^ false. ].
	args := Array
		with: [ :e | 
			(aMessage arguments first caValue: e)
				ifTrue: [ aMessage arguments second caValue: e ]
				ifFalse: [ old first caValue: e ] ].
	self 
		perform: sel, #Element:
		withArguments: args.
	^ true

