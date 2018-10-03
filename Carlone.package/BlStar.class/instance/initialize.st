initialization
initialize
	super initialize.
	innerRadius := 0.5 * (3 - 5 sqrt) * 1.57.
	rotation := 0.
	sides := 5.
	extent := 2 asPoint.
	self updateVertices.