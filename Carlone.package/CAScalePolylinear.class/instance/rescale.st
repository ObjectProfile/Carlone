transformations
rescale
	u := OrderedCollection new.
	i := OrderedCollection new.
	k := domain size min: range size.
	(domain at: k) < domain first ifTrue: [
		domain := domain reverse.
		range := range reverse ].
	
	2 to: k do: [ :j | 
		u add: (uninterpolate uninterpolate: (domain at: j -1 ) and: (domain at: j)).
		i add: (interpolate interpolate: (range at: j -1) and: (range at: j) )
		 ].
	
	