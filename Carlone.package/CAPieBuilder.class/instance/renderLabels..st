rendering
renderLabels: aRootElement
	label ifNil: [ ^ self ].
	textElements := label build.
	aRootElement addChildren: textElements.