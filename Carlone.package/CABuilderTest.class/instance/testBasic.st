tests
testBasic
	| b |
	b := CABuilder new.
	self assert: b shape equals: nil.
	
	self assert: b root class equals: BlElement.
	b shape: CAGeometryShape arc.
	self assert: b shape class equals: CAGeometryShape.
	b build.