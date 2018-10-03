actions
addAction: action
	self actions isEmpty 
		ifTrue: [ actions := OrderedCollection new ].
	self actions add: action.