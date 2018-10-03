public - convenient
addColorFadingFrom: startColor to: endColor text: textualDescription
	"Add a fading between startColor and endColor. A textualDescription is provided"
	self addColorFadingUsing: (Array with: startColor with: endColor) text: textualDescription