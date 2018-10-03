public
elementsOn: objects forEachElement: aBloc
	| elements |
	elements := self elementsOn: objects.
	elements do: [ :el | 
		el addChildren: (aBloc value: el).
		layout ifNotNil: [ layout setUpElement: el ] ].
	^ elements