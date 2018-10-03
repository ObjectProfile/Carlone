public - positioning
left
	self positionDo: [ :p |
		p
			outer;
			left;
			horizontalPadding: offset;
			middle;
			move.
		 ].