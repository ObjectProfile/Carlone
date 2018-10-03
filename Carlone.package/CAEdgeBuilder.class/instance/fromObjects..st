accessing
fromObjects: someObjectsOrABlock
	"Identify the elements we are considering for the edge building process. Note that the view has to be set beforehand."
	self assert: [ viewHasBeenManuallySet ] description: 'A view has to be set, please use #view:'.
	 
	(someObjectsOrABlock isCollection and: [ someObjectsOrABlock isSymbol not ])
		ifTrue: [ self fromElements: (rootElement elementsFromModels: someObjectsOrABlock) ]
		ifFalse: [ self fromElements: (rootElement elements select: [ :el | someObjectsOrABlock caValue: el caModel ]) ]