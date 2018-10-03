public
connectFrom: aFromBlock toAll: aBlockOrASymbol

	| fromElement tes |
	self resetCreatedEdges.
	self fromElements copy do: [ :e | 
		fromElement := self fromElements elementFromModel: (aFromBlock caValue: e caModel).
		tes := self toElements elementsFromModels: (aBlockOrASymbol caValue: e caModel).
		tes ifNotNil: [ 
			tes do: [ :toE | 
				self createEdgeIfNecessaryFrom: fromElement to: toE ] ] ].
	self moveBehindIfNecessary: createdEdges.
	^ createdEdges 