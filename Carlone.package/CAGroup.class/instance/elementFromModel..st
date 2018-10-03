accessing
elementFromModel: anObject
	"Return an element that corresponds to the object provided as parameter. If none is found, then return nil"
	| t key|
	self elementFromModelCache at: anObject ifPresent: [ :v |
		v isCollection ifFalse: [ ^ v ] ].
	"We have this line because of a bug of the implementation of CompiledMethod>>#="
	t := (anObject class == CompiledMethod) 
		ifTrue: [ self detect: [ :el | el caModel == anObject ] ifNone: [ nil ] ]
		ifFalse: [ self detect: [ :el | el caModel = anObject ] ifNone: [ nil ] ].
	"We have this hack for nil objects because in visualWorks a dictionary cannot have nil as a key"
	key := anObject isNil ifTrue: [ 'KeyForNilObjects' ] ifFalse: [ anObject ].
	self elementFromModelCache at: key put: t.
	^ t