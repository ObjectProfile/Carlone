public - convenient
addColoredObject: anObject text: aTextOrSymbolOrBlock color: aColor
	items add: (CALabelLegendItem new model: anObject; text: aTextOrSymbolOrBlock; color: aColor; textSize: self textSize)