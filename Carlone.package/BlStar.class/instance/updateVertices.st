updating
updateVertices
	vertices := self class 
		pointsForStar: self innerRadius
		rotation: self rotation degreesToRadians
		sides: self sides.
	self geometryExtent: extent