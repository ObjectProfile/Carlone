default attach points
addDefaultAttachPointToEdges
	| a |
	a := self defaultAttachPoint.
	edges do: [ :e | e shape attachPoint: a ]