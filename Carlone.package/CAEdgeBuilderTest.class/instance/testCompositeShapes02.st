tests
testCompositeShapes02

	| els lineShape edges |
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
				color: Color veryDarkGray).
	edges := CAEdgeBuilder new
		view: view;
		objects: Collection withAllSubclasses;
		shape: lineShape;
		connectFrom: #yourself toAll: #subclasses.
	RTTreeLayout on: els.
	
	self assert: (edges allSatisfy: [ :e | e shape == lineShape ])