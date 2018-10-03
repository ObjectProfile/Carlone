initialization
initialize
	super initialize.
	layoutBuilder := CALayoutBuilder new.
	content := BlElement new.
	content clipChildren: false.
	content 
		layout: (BlOnceLayout new 
			layout: (BlGridLayout new columnCount: 8)).
	content constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ].
	
	scrollable := BlPannableElement new.
	scrollable constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	scrollable contentElement: content.
	
	container := BlElement new.
	container constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	container addChild: scrollable.
	container addEventHandler: BlSlideHandler new.