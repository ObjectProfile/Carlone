accessing
elementsFromModels: objects
	"Return elements that corresponds to the objects provided as parameter. If none is found, then return an empty collection"
	| answer t |
	self assert: [ objects isCollection ] description: 'Provide a set of elements instead of one single element'. 
	answer := CAGroup new.
	objects do: [ :o |
		t := self elementsFromModel: o.
		t notNil ifTrue: [ answer addAll: t ] ].
	^ answer