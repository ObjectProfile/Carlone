public - positioning
top
	self positionDo: [ :p | 
		p 
			outer;
			verticalPadding: offset;
			top;
			center;
			move.
		 ].