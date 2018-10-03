public - positioning
right
	self positionDo: [ :p |
		p 
			outer;
			right;
			middle;
			horizontalPadding: offset;
			move.
		 ].