hooks
execute
	"Associate a color with a text"
	
	| background box textElement |
	background := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			"will take 100% of the parent"
			c linear weight: 1 ];
		yourself.	
	
	box := CAGeometryShape box
		background: color;
		matchExtent: textSize @ textSize;
		element.
		
	
	textElement := CALabelShape label
		text: text;
		elementOn: model.
		
	background addChild: box; addChild: textElement.
	^ background
	
"	| g |
	g := RTGroup new.
	g add: (RTBox new size: textSize; color: color) element.
	g add: ((RTLabel text: text) height: textSize; elementOn: model).
	RTHorizontalLineLayout new alignCenter; on: g.
	^ g"