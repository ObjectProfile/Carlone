reflective operations
executeDuring: aBlock element: element component: component
	| bool cmds |
	cmds := commands.
	bool := isForElement.
	commands := OrderedCollection new.
	aBlock caValue: self.
	self updateElement: element innerComponent: component.
	commands := cmds.
	isForElement := bool.
	