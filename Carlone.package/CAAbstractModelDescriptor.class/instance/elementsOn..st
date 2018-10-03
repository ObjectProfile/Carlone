public
elementsOn: aCollectionOfObjects
	| g |
	g := CAGroup new: aCollectionOfObjects size.
	aCollectionOfObjects doWithIndex: [ :obj :index | 
		g add: (self elementOn: obj index: index) ].
	^ g
	