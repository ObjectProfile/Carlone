tests - reversed
testDoNotAttachPointStraightVerticallyReversed

	| v bs |
	v := RTView new.

	bs := RTBox new elementsOn: #(1 2).
	v addAll: bs.
	v add: (RTArrowedLine new withBorderAttachPoint; edgeFrom: bs first to: bs second).
	bs @ RTDraggable.

	RTDominanceTreeLayout new
	    doNotAttachPoint;
		 verticallyReverse;
	    on: bs.

	self assert: v edges anyOne shape attachPoint class equals: RTBorderAttachPoint.