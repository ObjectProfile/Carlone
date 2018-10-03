iterating
forEachElement: aBloc
	| children |
	self do: [ :e | 
		children := aBloc value: e.
		e addChildren: children ]
	