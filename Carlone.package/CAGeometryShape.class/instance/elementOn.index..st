public
elementOn: object index: index
	| el geometry |
	el := self elementClass new.
	el 
		caModel: object;
		caIndex: index.
	geometry := self geometryClass new.
	self updateElement: el second: geometry.
	el size: geometry extent.
	el geometry: geometry.
	postCreation ifNotNil: [ 
		postCreation do: [ :b | b value: el ] ].
	^ el 