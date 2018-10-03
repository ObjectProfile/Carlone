tests - reversed
testVerticallyReversedAndAttachPointNo02
	| es v edge |
	v := RTView new.
	es := RTBox new color: Color blue trans; size: 10; elementsOn: #(1 2).
	v addAll: es.
	edge := RTArrowedLine new color: Color red trans; edgeFrom: es first to: es second.
	v add: edge.
	es @ RTDraggable.
	
	RTTreeLayout new verticallyReverse; doNotAttachPoint; on: es.

	self assert: edge trachelShape from equals: es first center.
	self assert: edge trachelShape from equals: 10 @ 30.
	self assert: edge trachelShape to equals: es second center.
	self assert: edge trachelShape to equals: 10 @ 0.