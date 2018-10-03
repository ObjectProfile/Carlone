tests - reversed
testVerticallyReversedAndAttachPoint
	| es v edge |
	v := RTView new.
	es := RTBox new color: Color blue trans; size: 10; elementsOn: #(1 2).
	v addAll: es.
	edge := RTArrowedLine new color: Color red trans; edgeFrom: es first to: es second.
	v add: edge.
	es @ RTDraggable.
	
	RTTreeLayout new verticallyReverse; on: es.

	self assert: edge trachelShape from equals: es first encompassingRectangle topCenter.
	self assert: edge trachelShape from equals: 10 @ 25.
	self assert: edge trachelShape to equals: es second encompassingRectangle bottomCenter.
	self assert: edge trachelShape to equals: 10 @ 5.