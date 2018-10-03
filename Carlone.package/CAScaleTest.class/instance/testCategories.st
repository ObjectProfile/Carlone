tests - colors
testCategories
	| color |
	color := CAScale category10.
	self assert: color range size equals: 10.
	
	1 to: 10 do: [ :i | 
		self assert: (color scale: i) class equals: Color ].
	
	1 to: 10 do: [ :i | 
		self assert: (color scale: i) equals: (color scale: i + 10) ].
	
	color := CAScale category20.
	
	self assert: color range size equals: 20.
	0 to: 19 do: [ :i | 
		self assert: (color scale: i) class equals: Color ].
	color := CAScale category20b.
	
	self assert: color range size equals: 20.
	color := CAScale category20c.
	self assert: color range size equals: 20.
	
	color := CAScale paired12.
	self assert: color range size equals: 12.