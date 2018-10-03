public associations
useAssociation: assoc
	"assoc have to be between model objects"
	self assert: [ assoc isKindOf: Association ] description: 'Please, provide an association instead'.
	self useAssociations: (Array with: assoc)