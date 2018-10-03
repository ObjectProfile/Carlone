public - pies
emphasize: object by: anIntegerOrASymbolOrABlock
	postCreation ifNil: [ postCreation := OrderedCollection new ].
	postCreation add: [ | element geometry delta v |
		element := elements elementFromModel: object.
		geometry := element geometry.
	
		v := (anIntegerOrASymbolOrABlock caValue: object).
		delta := ((v @ 0)) 
				rotateBy: ((geometry betaAngle - geometry alphaAngle) / 2 
					+ geometry alphaAngle) * 3.1415 / 180
				about: 0@0.
		element userData at: #emphasize put: delta
	].