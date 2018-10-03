tests
testArcPadding
	builder objects: (Array with: Dictionary with: Collection with: Set with: OrderedCollection ).
	builder slice: #numberOfMethods.
	builder shape
		segmentSpacing: 1.
	self assert: (builder shape globalAttributeAt: #segmentSpacing:) first class equals: BlockClosure.
	builder build.