pie - examples
createPieBuilder2
	| b r |
	r := Random new.
	b := CAPieBuilder new.
	b objects: ((1 to: 10) collect: [:e | r next]) sort.
	^ b