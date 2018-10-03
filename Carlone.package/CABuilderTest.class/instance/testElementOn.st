tests
testElementOn
	| b |
	b := CABuilder new.
	b shape: CAGeometryShape arc.
	self assert: (b elementOn: 1) class equals: BlElement.