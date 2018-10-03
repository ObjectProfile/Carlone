public
connectFromAll: aFromBlockOrSymbol to: aBlockOrASymbol

	| toElement tfromElements |
	self resetCreatedEdges.
	self fromElements copy do: [ :e | 
		tfromElements := self fromElements elementsFromModels: (aFromBlockOrSymbol caValue: e caModel). 
		toElement := self toElements elementFromModel: (aBlockOrASymbol caValue: e caModel).
		tfromElements ifNotNil: [ 
			tfromElements do: [ :fromElement | 
				self createEdgeIfNecessaryFrom: fromElement to: toElement ] ] ].
	self moveBehindIfNecessary: createdEdges.
	^ createdEdges