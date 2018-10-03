tests - reversed
testVerticallyReversedSetting
	| l |
	l := RTTreeLayout new.
	self deny: l shouldBeVerticallyReversed.
	self deny: l shouldBeHorizontallyReversed.
	l verticallyReverse.
	self assert: l shouldBeVerticallyReversed.
	self deny: l shouldBeHorizontallyReversed.