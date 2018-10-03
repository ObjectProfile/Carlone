public - accessing
elementsOn: aCollection
	| g |
	g := CAGroup new: aCollection size.
	aCollection doWithIndex: [ :obj : index |
		g add: (self elementOn: obj index: index) ].
	^ g