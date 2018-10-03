tests
testElement
	| g |
	g := CAGroup new.
	self assert: (g elementFromModel: 'foo') equals: nil.
	
	g add: (BlElement new caModel: 'bar'; yourself).
	self assert: (g elementFromModel: 'bar') notNil