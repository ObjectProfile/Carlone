accessing
toElements
	toElements ifNil: [ ^ self root elements ].
	^ toElements