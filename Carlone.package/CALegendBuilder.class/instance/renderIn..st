rendering
renderIn: aView
	| background |
	super renderIn: aView.

	background := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent.
			"will take 100% of the parent"
			c linear weight: 1 ];
		yourself.	
	items do: [ :item | background addChild: item execute ].
	self root addChild: background



