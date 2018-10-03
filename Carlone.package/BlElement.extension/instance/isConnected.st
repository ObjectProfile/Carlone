*Carlone
isConnected
	"Return true if the element is connected to at least one element (which would be itself)"
	"An element is connected if it has at least one incoming or outgoing edge"
	^ self incomingEdges notEmpty or: [ self outgoingEdges notEmpty ]