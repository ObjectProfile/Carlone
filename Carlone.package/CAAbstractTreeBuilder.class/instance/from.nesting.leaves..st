building
from: objects nesting: block1 leaves: block2
	"objects a collection of trees"
	rootNodes := objects collect: [:obj | 
		self createElements: obj nesting: block1 leaves: block2 depth: 1 ].
	rootNodes do: [ :e | e userData at: #parent put: nil ].
	^ rootNodes