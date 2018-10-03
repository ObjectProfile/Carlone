public
onElement: anElement
	
	anElement addEventHandler: (BlEventHandler
		on: BlScrollEvent
		do: [ :evt | 
			self processEvent: evt in: anElement.
			]).
		