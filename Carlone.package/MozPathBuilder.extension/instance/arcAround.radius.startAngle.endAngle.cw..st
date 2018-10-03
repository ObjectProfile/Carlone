*Carlone
arcAround: aCenterPoint radius: aRadius startAngle: aStartAngle endAngle: anEndAngle cw: aBool
	self
		primArcOriginX: aCenterPoint x
		originY: aCenterPoint y
		radius: aRadius
		startAngle: aStartAngle
		endAngle: anEndAngle
		antiClockwise: aBool
		absolute: self isAbsolute