tests
testBasicBox
	| shape element geometry |
	shape := CAGeometryShape box.
	shape
		"initializeWith: 2; For corner radius"
		size: 40;
		background: Color lightGray.
		
	self assert: shape geometryClass equals: BlRectangle.
	
	self assert: (shape globalAttributeAt: #background:) class equals: Array.
	
	"shape cornerRadius: 10."
	
	element := shape elementOn: 'foobar'.
	geometry := element geometry.
	element computeLayout.
	
	self assert: element background paint color equals: Color lightGray.
	self assert: geometry extent equals: 40@40.
	"self assert: geometry cornerRadii topLeft equals: 10."
