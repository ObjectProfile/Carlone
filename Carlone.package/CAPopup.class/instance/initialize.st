initialization
initialize
	super initialize.
	label := CALabelShape label.
	
	box := CAGeometryShape box
		"cornerRadius: 2;"
		matchExtent: 100 asPoint;
		background: (Color colorFrom: '#efefef');
		effect: [(BlDropShadowEffect 
			color: (Color black alpha: 0.5) 
			width: 15
			offset: 0@7)];
		border: (BlBorder builder 
			paint: Color gray;
			width: 1;
			build).
