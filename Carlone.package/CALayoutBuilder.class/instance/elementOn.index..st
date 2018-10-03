public
elementOn: aBlElment index: index
	| el layout |
	el := self elementClass new.
	el caModel: aBlElment.
	
	layout := self layoutClass new.
	self updateElement: el second: layout.
	
	^ layout