tests
testAllowRepetitionAndUseAssociations

	b := RTMondrian new.
	b nodes: (1 to: 3).
	b shape line
		color: Color red trans;
		withVerticallAttachPoint.
	b edges noRepetition; useAssociations: (Array with: 1 -> 2 with: 2 -> 3 with: 1 -> 2).
	b layout grid.
	b build.
	self assert: b view numberOfEdges equals: 2