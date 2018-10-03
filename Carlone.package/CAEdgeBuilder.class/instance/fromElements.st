accessing
fromElements
	fromElements ifNil: [ ^ self root elements ].
	^ fromElements