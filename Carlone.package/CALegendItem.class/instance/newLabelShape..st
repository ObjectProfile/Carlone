utility
newLabelShape: widthDescription
	"Return a new label with the argument as the content of the label"
	^ RTLabel new color: self textColor; text: widthDescription; height: textSize; yourself