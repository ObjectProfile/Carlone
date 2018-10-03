pie - examples
createPieBuilder
	| b classes |
	classes := Array with: Dictionary with: OrderedCollection with: String with: Set with: Array.
	b := CAPieBuilder new.
	b objects: classes.
	b slice: #numberOfMethods.
	^ b