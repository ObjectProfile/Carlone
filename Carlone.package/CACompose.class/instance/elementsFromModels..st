public
elementsFromModels: objects
	| group |
	group := CAGroup new addAll: self root children; yourself.
	^ group elementsFromModels: objects