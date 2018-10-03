tests
testInitialSize2
	| someElements |
	someElements := CAGeometryShape box elementsOn: #(1 2).
	someElements do: #computeLayout.
	self assert: someElements first extent equals: 5 @ 5.
	self assert: someElements second extent equals: 5 @ 5