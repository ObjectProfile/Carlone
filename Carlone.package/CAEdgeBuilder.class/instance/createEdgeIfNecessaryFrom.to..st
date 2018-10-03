private - utility
createEdgeIfNecessaryFrom: fromElement to: toElement
	(self shouldCreateEdgeFrom: fromElement to: toElement)
		ifTrue: [ createdEdges add: (self edgeFrom: fromElement to: toElement) ]