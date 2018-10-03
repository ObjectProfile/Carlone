reversing
horizontallyReverse: elements
	"Horizontally reverse the elements, as well as the attachpoints"

	| g largeur |
	g := elements asGroup.
	largeur := g extent x.
	elements
		do: [ :el | el translateTo: (largeur - el position x) @ el position y ]