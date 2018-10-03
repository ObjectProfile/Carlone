accessing
elementOn: object index: index
	| el geometry |
	el := self elementClass new.
	el
		caModel: object;
		caIndex: index.
	self executeActions: #isPreload on: el.
	geometry := self geometryClass new.
	self updateElement: el innerComponent: geometry.
	el
		size: geometry extent;
		geometry: geometry.
	self executeActions: #isPostload on: el.
	^ el
	