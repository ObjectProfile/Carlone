layout-utils
layoutVerticalRow: row
	| container totalHeight areaToLayout width |
	container := rectangle currentSubrectangle.
	totalHeight := container height.
	areaToLayout := row inject: 0 into: [ :s :e | s+ (e userData at: #area) ].
	width := areaToLayout /totalHeight.
	row do: [ :each | each size: (width @ ( (each userData at: #area) / width)) ].
	self translateElementsVertically: row in: container.