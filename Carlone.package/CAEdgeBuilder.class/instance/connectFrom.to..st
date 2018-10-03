public
connectFrom: aFromBlock to: aBlockOrASymbol
	| toElement fromElement |
	self resetCreatedEdges.
	self fromElements copy
		do: [ :e | 
			fromElement := self fromElements elementFromModel: (aFromBlock caValue: e caModel).
			toElement := self toElements elementFromModel: (aBlockOrASymbol caValue: e caModel).
			toElement ifNotNil: [ self createEdgeIfNecessaryFrom: fromElement to: toElement ] ].
	self moveBehindIfNecessary: createdEdges.
	^ createdEdges