*Carlone
outgoingEdges
	^ self userData at: #outgoingEdges ifAbsentPut: [ OrderedCollection new ]