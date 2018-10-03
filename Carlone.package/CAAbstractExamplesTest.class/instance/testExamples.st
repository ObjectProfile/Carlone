tests
testExamples
	CAAbstractExamples subclasses 
		do: [ :cls | | inst |
			inst := cls new.
			cls methodsDo: [ :met | 
				(met pragmas anySatisfy: [ :p | p keyword = #noTest ]) 
					ifFalse: [ inst perform: met selector ] ] ]
		 displayingProgress: [ :cls |
			'Analizing', cls name ].