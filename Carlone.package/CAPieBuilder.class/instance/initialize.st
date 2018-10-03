initialization
initialize
	super initialize.
	self centerGap: 0@0; start: 0.
	shape := CAGeometryBuilder arc
		onElement;
		innerRadius: 0;
		externalRadius: 100;
		background: [ Color random ];
		alphaAngle: [:e | self innerAngleFor: e ];
		betaAngle: [ :e | self outerAngleFor: e ];
		onModel.
	