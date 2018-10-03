actions
executeActions: block on: element
	self actions do: [ :action |
		action element: element.
		(block caValue: action) 
			ifTrue: [ action execute ] ].