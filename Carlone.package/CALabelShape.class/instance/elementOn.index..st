public
elementOn: object index: index
	| element text |
	
	element :=  self elementClass new.
	element
		caModel: object;
		caIndex: index.
	text := self labelClass string: (self textFor: element) asString.
	element text: text.
	attributes applyOn: text.
	self updateElement: element second: text.
	interaction ifNotNil: [ interaction setUpElement: element ].
	^ element.
	