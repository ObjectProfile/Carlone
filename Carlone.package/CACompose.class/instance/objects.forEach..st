public
objects: someObjects forEach: aBlock
	someObjects do: [ :anObject | 
		self addVisualization: (aBlock value: anObject) ]