tests
testLabel
	| e |
	builder label text: 'hi'.
	e := builder label elementOn: 1.
	self assert: (builder label textFor: e) equals: 'hi'.
