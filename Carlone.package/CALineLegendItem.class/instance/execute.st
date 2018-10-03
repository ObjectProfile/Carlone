hooks
execute
	"Associate a color with a text"

	| background box textElement |
	background := BlElement new
		layout: BlLinearLayout horizontal alignCenterLeft;
		background: Color veryDarkGray;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			"will take 100% of the parent"
			c linear weight: 1 ];
		yourself.	
	
	box := CAGeometryShape box
		background: color;
		matchExtent: (textSize * 2) @ (textSize * 0.4);
		element.
	
	textElement := CALabelShape label
		text: text;
		element.
		
	background addChild: box; addChild: textElement.
	^ background
	
"	| g |
	g := RTGroup new.
	g add: (RTBox new height: textSize * 0.3; width: textSize; color: color) element.
	g add: ((self newLabelShape: text) elementOn: text).
	RTHorizontalLineLayout new alignCenter; on: g.
	^ g"