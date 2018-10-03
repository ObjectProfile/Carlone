tests
testGrid2
	| v box elements |
	v := CACompose new.
	box := CAGeometryShape box
		size: [:m | m ];
		background: Color lightGray.
	box interaction popup.
	box layout grid.
	elements := box elementsOn: (10 to: 200 by: 10).
	elements
		forEach: [ :aNumber | 
			CAGeometryShape box
				size: 5;
				background: Color blue;
				elementsOn: (1 to: 5) ].
	v addAll: elements.
	v root @ CADraggable.
	v grid.
	v