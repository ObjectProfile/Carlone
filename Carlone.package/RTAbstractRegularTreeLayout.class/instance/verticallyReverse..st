reversing
verticallyReverse: elements
	"Vertically reverse the elements, as well as the attachpoints"

	| g hauteur |
	g := elements asGroup.
	hauteur := g extent y.
	elements
		do: [ :el | el translateTo: el position x @ (hauteur - el position y) ]