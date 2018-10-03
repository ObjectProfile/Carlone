tests
testBasic
	| morph |
	morph := (PragmaMenuBuilder pragmaKeyword: 'worldMenuTest' model: nil) menu popUpInWorld.
	morph delete.