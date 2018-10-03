accessing
setEdgesFromElements: elements 
	| view |
	elements isEmpty ifTrue: [ ^ self ].
	
	^ self
		edges:
			((elements flatCollect: #incomingEdges)
				select: [ :anEdge | anEdge isUsedInLayout and: (elements includes: anEdge from) ])
"	view := elements anyOne view.
	view ifNil: [ ^ self ].
	self edges: (view edges select: [ :el | 
		(el isUsedInLayout and: [ elements includes: el from ]) and: [ elements includes: el to ] ]).
	"