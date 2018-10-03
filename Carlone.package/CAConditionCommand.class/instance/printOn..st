printing
printOn: stream
	stream nextPutAll: 'if: '.
	condition printOn: stream.
	stream nextPutAll: ' actions: '.
	message printOn: stream