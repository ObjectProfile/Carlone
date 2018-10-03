accessing
color: aColor
	self assert: [ aColor notNil ] description: 'You have to provide a color'.
	color := aColor