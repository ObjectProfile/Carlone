tests
testCompositeShapes

	| els lineShape edges eb |
	view := RTView new.
	els := (RTBox new
		size: 10;
		color: Color blue;
		borderColor: Color veryLightGray)
		elementsOn: Collection withAllSubclasses.
	els @ RTDraggable.
	view addAll: els.
	lineShape := (RTLine new
				attachPoint: RTShorterDistanceAttachPoint new;
				color: Color veryDarkGray)
			+
					(RTSimpleArrowHead new
						attachPoint: RTShorterDistanceAttachPoint new;
						color: Color veryDarkGray).
	eb := CAEdgeBuilder new.
	eb
		view: view;
		objects: Collection withAllSubclasses;
		shape: lineShape.
	self assert: eb shape hasSetLineShape.

	edges := eb	connectFrom: #yourself toAll: #subclasses.
	RTTreeLayout on: els.
	
	
	self assert: (edges allSatisfy: [ :e | e shape == lineShape ])