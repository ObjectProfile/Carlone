public - positioning
below
	self positionDo: [ :p | 
		p 
			outer;
			verticalPadding: offset;
			bottom;
			center;
			move.
		 ].