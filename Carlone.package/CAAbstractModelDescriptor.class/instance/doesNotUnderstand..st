reflective operations
doesNotUnderstand: aMessage
	| args |
	args := Array with: aMessage.
	#(isElementCondition: isModelCondition: isElementSetter: isModelSetter:)
		do: [ :cond | 
			(self perform: cond withArguments: args)
				ifTrue: [ ^ self ] ].
	
	self privateSet: aMessage selector with: aMessage arguments