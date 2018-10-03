public - convenient
addRectanglePolymetricWidth: widthDescription height: heightDescription box: boxDescription
	"Associate a color with a text"

	items add: (RTPolymorphicBoxLegendItem new 
						widthDescription: widthDescription;
						heightDescription: heightDescription;
						boxDescription: boxDescription;
						textSize: self textSize)