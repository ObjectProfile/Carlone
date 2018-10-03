tests
testInitialSize

	| boxAsBlocElement |
	boxAsBlocElement := CAGeometryShape box element.
	boxAsBlocElement computeLayout.
	self assert: boxAsBlocElement extent equals: 5 @ 5