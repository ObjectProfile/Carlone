building
from: objects using: ablock
	"objects a collection of trees"
	rootNodes := objects collect: [ :obj | 
		self createElements: obj nesting: ablock leaves: nil depth: 1 ].
	rootNodes do: [ :e | e userData at: #parent put: nil ].
	^ rootNodes