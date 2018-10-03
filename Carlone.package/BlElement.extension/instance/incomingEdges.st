*Carlone
incomingEdges
	^ self userData at: #incomingEdges ifAbsentPut: [ OrderedCollection new ]