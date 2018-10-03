private
postCreationAdd: aBlock
	postCreation ifNil: [ postCreation := OrderedCollection new ].
	postCreation add: aBlock