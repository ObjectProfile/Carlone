tests - reversed
testHorizontallyReversedSetting
	| l |
	l := RTHorizontalTreeLayout new.
	self deny: l shouldBeHorizontallyReversed.
	self deny: l shouldBeVerticallyReversed.
	l horizontallyReverse.
	self assert: l shouldBeHorizontallyReversed.
	self deny: l shouldBeVerticallyReversed.