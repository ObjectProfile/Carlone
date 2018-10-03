rendering
renderArcs: aRootElement
	
	elements := self elementsOn: objects.
	postCreation ifNotNil: [ postCreation do: #value ].
	aRootElement addChildren: elements.