utility
isModelSetter: aMessage
	aMessage arguments size = 1 ifFalse: [ ^ false ].
	self 
		perform: aMessage selector allButLast, #Element:
		withArguments: (Array with: [:el | aMessage arguments first caValue: el caModel ] ).
	^ true