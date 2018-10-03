tests
testContainsPoint
	| element |
	element := arc asElement.
	self assert: (arc containsPoint: 0@0 in: element).