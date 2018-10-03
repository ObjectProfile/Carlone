public
edges
	"Return the edges"
	^ CAGroup withAll: (self root children select: [ :e | e class == BlLineElement ])