public associations
useElementAssociations: associationsBetweenElements
	associationsBetweenElements do: [ :assoc |
		self edgeFrom: assoc key to: assoc value ]