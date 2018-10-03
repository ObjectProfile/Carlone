accessing
edges: aCollection
	"Set the list of edges that should be considered for the layout.
	If none is specified (i.e., if this method is not called), then the 
	edges are infered."
	edges := aCollection.
"	self shouldSetDefaultAttachPoint
		ifTrue: [ self addDefaultAttachPointToEdges ]"