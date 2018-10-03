private
createElements: atree nesting: block1 leaves: block2 depth: depth
	| children e leaves |
	e := self shape elementOn: atree index: depth.
	self elements add: e.
	children := block1 caValue: atree.
	children := children collect: [ :child | | e2 |
		e2 := self 
			createElements: child 
			nesting: block1 
			leaves: block2 
			depth: depth + 1.
		e2 userData at: #parent put: e.
		e2 ] as: CAGroup.
	block2 ifNil: [ 
		e userData at: #children put: children.
		^ e ].
	leaves := (block2 caValue: atree) collect: [:child | | e2 |
		e2 := self shape elementOn: child index: depth + 1.
		self elements add: e2.
		e2 userData at: #parent put: e.
		e2 ] as: CAGroup.
	e userData at: #children put: children, leaves.
	^ e
		
	