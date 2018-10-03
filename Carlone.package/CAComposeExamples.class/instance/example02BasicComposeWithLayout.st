compose examples
example02BasicComposeWithLayout
	<script: 'self new example02BasicComposeWithLayout inspect'>
	| v box blueBox elements first second l |
	v := CACompose new.
	
	box := CAGeometryShape box
		size: #yourself;
		background: Color lightGray;
		when: [ :e | e caModel = 120 
			ifTrue: [ BlMouseEnterEvent  ] 
			ifFalse: [ BlDoubleClickEvent ] ]  
		do: [ :e | [ :evt | e background: Color random ] ].
	box interaction popup.
	box layout grid 
		vertical;
		rowCount: 15.
	elements := box
		elementsOn: (10 to: 200 by: 10)
		forEach: [ :aNumber | 
			blueBox := CAGeometryShape box
				size: 5;
				background: Color blue.
			blueBox interaction popup.
			blueBox elementsOn: (1 to: aNumber) ].
	v addAll: elements.
	v root @ CADraggable.
	v grid.
	first := elements elementFromModel: 100.
	second := elements elementFromModel: 160.
	l := BlLineElement new
		fromAnchor: (BlElementCenterAnchor element: first);
		toAnchor: (BlElementCenterAnchor element: second);
		border: (BlBorder paint: Color red width: 4);
		yourself.
	v addChild: l.
	^ v