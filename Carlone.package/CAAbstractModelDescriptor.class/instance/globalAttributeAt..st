accessing
globalAttributeAt: key
	globalAttributes ifNil: [ ^ nil ].
	^ globalAttributes at: key.