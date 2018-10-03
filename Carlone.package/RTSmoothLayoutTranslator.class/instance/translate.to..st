hook
translate: element to: newPosition
	move := RTLinearMove new
					to: newPosition during: nbCycles on: element.

	view ifNil: [ self view: element view ].
	view addAnimation: move.