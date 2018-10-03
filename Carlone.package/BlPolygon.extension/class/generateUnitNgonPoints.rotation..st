*Carlone
generateUnitNgonPoints: sides rotation: rotationAngle
	
	^ self generateUnitNgonPoints: sides  rotation: rotationAngle
		angle: [ :a :i | a negated ] 
		radius: [ :a :i | 1 ]