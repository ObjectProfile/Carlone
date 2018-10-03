tests
testBasic
	| shape |
	shape := CAGeometryShape arc.
	shape
		backgroundElement:  Color red.
	self assert: shape geometryClass equals: BlCircleSector.
	self assert: (shape globalAttributeAt: #background:) equals: {Color red}.