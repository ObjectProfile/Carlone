updating
updateElement: element innerComponent: component
	| copy |
	copy := self commands copy.
	copy do: [ :command |
		command 
			element: element;
			component: component ].
	copy do: #execute