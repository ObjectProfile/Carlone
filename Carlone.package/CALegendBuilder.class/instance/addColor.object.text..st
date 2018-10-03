public - convenient
addColor: aColor object: anObject text: aBlockOrSelector
	"Associate a color with a text"
	items add: (CAColorLegendItem new color: aColor; model: anObject; text: aBlockOrSelector;
	textSize: self textSize)