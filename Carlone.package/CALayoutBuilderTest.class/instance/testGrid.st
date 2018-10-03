tests
testGrid
	| l layout |
	l := CALayoutBuilder new.
	l grid.
	self 
		assert: l layoutClass equals: BlGridLayout;
		assert: l elementClass equals: CAElement.
		
	"This is too ugly but it is just for testing coverage"
	l grid
		columnCount: [ :e | 
			e caIndex: nil.
			e caIndex isNil ifTrue: [ 1 ] ].
	layout := l elementOn: BlElement new.
	self assert: layout class equals: BlGridLayout.