accessing
relocate: aPosition

	| center |
	center := self encompassingRectangle center.
	self translateBy: (aPosition - center)