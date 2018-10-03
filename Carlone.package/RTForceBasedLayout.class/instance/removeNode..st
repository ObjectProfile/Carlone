updating
removeNode: node
	nodes remove: node.
	node connectedEdges do: [ :ed | self removeEdge: ed. ]