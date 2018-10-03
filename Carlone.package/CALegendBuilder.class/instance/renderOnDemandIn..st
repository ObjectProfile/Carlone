hooks
renderOnDemandIn: aView
	| label myGroup |
	super renderIn: aView.
	RTVerticalLineLayout on: group.
	label := (RTLabel new color: Color red) elementOn: onDemandText.
	label setAsFixed.
	label @ RTHighlightable.
	aView add: label.
	label translateTo: label extent / 2.
	label
		@
			(RTPopup new
				alphaPopupBackground: self backgroundTransparencyOnDemand;
				background: Color white
					group: [ :gg :el | 
					myGroup := self group.
					gg addAll: (myGroup flatCollect: #yourself) ])