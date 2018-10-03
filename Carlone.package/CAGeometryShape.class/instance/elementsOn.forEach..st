public
elementsOn: objects forEach: aBloc
	^ self elementsOn: objects forEachElement: [ :e | aBloc value: e caModel ].