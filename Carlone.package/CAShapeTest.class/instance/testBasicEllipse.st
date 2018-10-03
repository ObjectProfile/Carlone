tests
testBasicEllipse
	| shape element geometry |
	shape := CAGeometryShape ellipse.
	shape
		diameter:  100;
		background: Color lightGray.
		
	self assert: shape geometryClass equals: BlEllipse.
	self assert: (shape globalAttributeAt: #background:) class equals: Array.
	
	element := shape elementOn: 'foobar'.
	geometry := element geometry.
	element computeLayout.
	
	self assert: element background paint color equals: Color lightGray.
	self assert: geometry extent equals: 100@100.
