*Carlone
translateBy: aDelta

	self transform
		inherit;
		origin: (BlAffineTransformationPositionOrigin position: 0@0);
		translateBy: (BlVector x: aDelta asPoint x y: aDelta asPoint y z: 0);
		apply