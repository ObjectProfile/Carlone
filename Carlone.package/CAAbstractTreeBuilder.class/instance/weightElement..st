weight
weightElement: block
	"
	This builder uses weight variable do calculate the size of each rectangle
	weight block recives an element of the square and return a number
	self weightElement: [:element | 1 ]"
	weight := block
	
	