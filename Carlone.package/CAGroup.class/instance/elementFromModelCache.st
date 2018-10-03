accessing
elementFromModelCache
	"Define a cache for the element lookup from models"
	elementFromModelCache ifNil: [ elementFromModelCache := Dictionary new ].
	^ elementFromModelCache