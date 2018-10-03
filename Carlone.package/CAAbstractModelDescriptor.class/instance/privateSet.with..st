private
privateSet: selector with: arg
	| sel |
	sel := selector asSymbol.
	(self elementClass canUnderstand: sel) 
		ifTrue: [
			elementKeys ifNil: [ elementKeys := OrderedCollection new ].
			elementKeys add: sel ]
		ifFalse: [
			secondKeys ifNil: [ secondKeys := OrderedCollection new ].
			secondKeys add: sel ].
	self globalAttributes at: sel put: arg.
	

