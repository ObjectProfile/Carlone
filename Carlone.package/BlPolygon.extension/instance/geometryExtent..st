*Carlone
geometryExtent: newExtent
	| min max sx sy |
	
	min := vertices min.
	max := vertices max.
	sx := newExtent x / (max x - min x).
	sy := newExtent y / (max y - min y).
	vertices doWithIndex: [ :p :i |
		vertices at: i put: (p x * sx)@(p y * sy)].
	extent := newExtent.