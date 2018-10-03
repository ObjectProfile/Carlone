public - pies
arcRadiusAuto
	shape 
		onElement;
		cornerRadius: [ :el | | i e |
			e := (shape executeCommand: #externalRadius:) first.
			i := (shape executeCommand: #innerRadius:) first.
			((i * i) + (e * e)) sqrt ].