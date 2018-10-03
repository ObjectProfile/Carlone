accessing
elements
	"Return the elements"
	^ CAGroup withAll: (self root children select: [ :e | e class == BlElement ])