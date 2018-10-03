"
CAEdgeBuilder offers an API to easily build edges.

-=-=-=-=
c := CACompose new.
c addAll: (CAGeometryShape box elementsOn: (1 to: 20)).
c grid.

eb := CAEdgeBuilder new.
eb root: c.
eb objects: (2 to: 20).
eb connectTo: [ :e | e - 1 ].
c
-=-=-=-=

Here is an example:
[ [ [ 
	| v es |
	v := RTView new.

	es := (RTEllipse new size: 20) elementsOn: (1 to: 20).
	v addAll: es.

	RTEdgeBuilder new
		view: v;
		objects: (1 to: 20);
		connectFrom: [ :value | value // 2 ].

	es @ RTPopup @ RTDraggable.
	RTTreeLayout on: es.
	v ] ] ]
"
Class {
	#name : #CAEdgeBuilder,
	#superclass : #CABuilder,
	#instVars : [
		'allowRepetition',
		'fromElements',
		'toElements',
		'shouldMoveBehind',
		'shouldNotBeUsedInLayout',
		'createdEdges',
		'viewHasBeenManuallySet',
		'actions',
		'view'
	],
	#category : #'Carlone-Builder-EdgeBuilder'
}

{ #category : #'public repetition' }
CAEdgeBuilder >> allowRepetition [
	allowRepetition := true
]

{ #category : #public }
CAEdgeBuilder >> connectFrom: aBlockOrASymbol [
	^ self connectFrom: aBlockOrASymbol to: [ :each | each ]
]

{ #category : #public }
CAEdgeBuilder >> connectFrom: aFromBlock to: aBlockOrASymbol [
	| toElement fromElement |
	self resetCreatedEdges.
	self fromElements copy
		do: [ :e | 
			fromElement := self fromElements elementFromModel: (aFromBlock caValue: e caModel).
			toElement := self toElements elementFromModel: (aBlockOrASymbol caValue: e caModel).
			toElement ifNotNil: [ self createEdgeIfNecessaryFrom: fromElement to: toElement ] ].
	self moveBehindIfNecessary: createdEdges.
	^ createdEdges
]

{ #category : #public }
CAEdgeBuilder >> connectFrom: aFromBlock toAll: aBlockOrASymbol [

	| fromElement tes |
	self resetCreatedEdges.
	self fromElements copy do: [ :e | 
		fromElement := self fromElements elementFromModel: (aFromBlock caValue: e caModel).
		tes := self toElements elementsFromModels: (aBlockOrASymbol caValue: e caModel).
		tes ifNotNil: [ 
			tes do: [ :toE | 
				self createEdgeIfNecessaryFrom: fromElement to: toE ] ] ].
	self moveBehindIfNecessary: createdEdges.
	^ createdEdges 
]

{ #category : #public }
CAEdgeBuilder >> connectFromAll: aFromBlockOrSymbol [
	^ self connectFromAll: aFromBlockOrSymbol to: [ :each | each ]

]

{ #category : #public }
CAEdgeBuilder >> connectFromAll: aFromBlockOrSymbol to: aBlockOrASymbol [

	| toElement tfromElements |
	self resetCreatedEdges.
	self fromElements copy do: [ :e | 
		tfromElements := self fromElements elementsFromModels: (aFromBlockOrSymbol caValue: e caModel). 
		toElement := self toElements elementFromModel: (aBlockOrASymbol caValue: e caModel).
		tfromElements ifNotNil: [ 
			tfromElements do: [ :fromElement | 
				self createEdgeIfNecessaryFrom: fromElement to: toElement ] ] ].
	self moveBehindIfNecessary: createdEdges.
	^ createdEdges
]

{ #category : #public }
CAEdgeBuilder >> connectTo: aBlockOrASymbol [
	^ self connectFrom: [ :each | each ] to: aBlockOrASymbol
]

{ #category : #public }
CAEdgeBuilder >> connectToAll: aBlockOrASymbol [
	"Should this method use connectFrom:ToAll: ?????"
	| tmptoElements |
	self resetCreatedEdges.
	self fromElements copy do: [ :e | 
		tmptoElements := self toElements elementsFromModels: (aBlockOrASymbol caValue: e caModel).
		tmptoElements ifNotNil: [ 
			tmptoElements do: [ :toE | 
				self createEdgeIfNecessaryFrom: e to: toE ] ] ].
	self moveBehindIfNecessary: createdEdges.
	^ createdEdges
]

{ #category : #'private - utility' }
CAEdgeBuilder >> createEdgeIfNecessaryFrom: fromElement to: toElement [
	(self shouldCreateEdgeFrom: fromElement to: toElement)
		ifTrue: [ createdEdges add: (self edgeFrom: fromElement to: toElement) ]
]

{ #category : #public }
CAEdgeBuilder >> edgeFrom: source to: target [ 
	"source and target are elements"
	| newEdge |
	newEdge := BlLineElement new
		zIndex: 10;
		border: (BlBorder paint: Color red width: 2);
		yourself.
	
	newEdge fromAnchor: (BlElementBottomCenterAnchor element: source).
	newEdge toAnchor: (BlElementBottomCenterAnchor element: target).

	target addIncomingEdge: newEdge.
	source addOutgoingEdge: newEdge.

	rootElement addChild: newEdge.
	^ newEdge
]

{ #category : #accessing }
CAEdgeBuilder >> elements: someElements [
	self toElements: someElements.
	self fromElements: someElements
]

{ #category : #accessing }
CAEdgeBuilder >> fromElements [
	fromElements ifNil: [ ^ self root elements ].
	^ fromElements
]

{ #category : #accessing }
CAEdgeBuilder >> fromElements: someElements [
	fromElements := someElements
]

{ #category : #accessing }
CAEdgeBuilder >> fromObjects [
	"Return the list of objects considered as targets for the edges"
	^ self fromElements collect: #caModel
]

{ #category : #accessing }
CAEdgeBuilder >> fromObjects: someObjectsOrABlock [
	"Identify the elements we are considering for the edge building process. Note that the view has to be set beforehand."
	self assert: [ viewHasBeenManuallySet ] description: 'A view has to be set, please use #view:'.
	 
	(someObjectsOrABlock isCollection and: [ someObjectsOrABlock isSymbol not ])
		ifTrue: [ self fromElements: (rootElement elementsFromModels: someObjectsOrABlock) ]
		ifFalse: [ self fromElements: (rootElement elements select: [ :el | someObjectsOrABlock caValue: el caModel ]) ]
]

{ #category : #'public - configuration' }
CAEdgeBuilder >> highlightable [
	"Make the edges highlightable.
	Here is an example:
	
	| b edges |
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).

	b edges 
		moveBehind; 
		highlightable;
		connectFrom: [ :v | v // 2 ].

	b layout cluster.
	b

	"
	actions add: [ :edge | 
		edge @ RTHighlightable ] 
]

{ #category : #initialization }
CAEdgeBuilder >> initialize [
	super initialize.
	self noRepetition.
	shouldMoveBehind := false.
	shouldNotBeUsedInLayout := true.
	
	"The view has to be explicitely set by the end-user"
	viewHasBeenManuallySet := false.
	
	actions := OrderedCollection new
]

{ #category : #accessing }
CAEdgeBuilder >> label: twoArgBlock [
	"Method useful to label edges. The argument is a two arg block that accept the starting object model and the ending object model. The block has to return a String that will be used to label the edge.
	
	Here is an example:
	| b edges |
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).

	b edges 
		moveBehind; 
		highlightable;
		label: [ :from :to | from asString, '>', to asString ];
		connectFrom: [ :v | v // 2 ].

	b layout cluster.
	b
	"
	^ self label: twoArgBlock fontSize: TRLabelShape defaultFontSize
]

{ #category : #accessing }
CAEdgeBuilder >> label: twoArgBlock fontSize: fontSizeAsBlockOrValue [
	"Method useful to label edges. The argument is a two arg block that accept the starting object model and the ending object model. The block has to return a String that will be used to label the edge.
	
	Here is an example:
	| b edges |
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).

	b edges 
		moveBehind; 
		highlightable;
		label: [ :from :to | from asString, '>', to asString ] fontSize: 5;
		connectFrom: [ :v | v // 2 ].

	b layout cluster.
	b
	"
	actions add: [ :edge | 
		| lbl lblEl |
		lbl := twoArgBlock value: edge from model value: edge to model.
		lblEl := RTLabel new height: fontSizeAsBlockOrValue; elementOn: lbl.
		view add: lblEl.
		TRConstraint stick: lblEl between: edge from and: edge to ] 
]

{ #category : #accessing }
CAEdgeBuilder >> labelElement: oneArgBlock [
	"Method useful to label edges. The argument is a one arg block that accept the edge. The block has to return a String that will be used to label the edge.
	
	Here is an example:
	| b edges |
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).

	b edges 
		moveBehind; 
		highlightable;
		labelElement: [ :anEdge | anEdge from model asString, '>', anEdge to model asString ];
		connectFrom: [ :v | v // 2 ].

	b layout cluster.
	b
	"
	^ self labelElement: oneArgBlock fontSize: TRLabelShape defaultFontSize
]

{ #category : #accessing }
CAEdgeBuilder >> labelElement: oneArgBlock fontSize: fontSizeAsBlockOrValue [
	"Method useful to label edges. The argument is a one arg block that accept the edge. The block has to return a String that will be used to label the edge.
	
	Here is an example:
	| b edges |
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).

	b edges 
		moveBehind; 
		highlightable;
		labelElement: [ :anEdge | anEdge from model asString, '>', anEdge to model asString ] fontSize: 5;
		connectFrom: [ :v | v // 2 ].

	b layout cluster.
	b
	"
	actions add: [ :edge | 
		| lbl lblEl |
		lbl := oneArgBlock value: edge.
		lblEl := RTLabel new height: fontSizeAsBlockOrValue; elementOn: lbl.
		view add: lblEl.
		TRConstraint stick: lblEl between: edge from and: edge to ] 
]

{ #category : #'private - utility' }
CAEdgeBuilder >> linkElements: someElements [
	"Link the first element to the second, the second to the third and so on"
	| head |
	head := someElements first.
	someElements allButFirst do: [ :e |
		self edgeFrom: head to: e.
		head := e.
		]
]

{ #category : #accessing }
CAEdgeBuilder >> moveBehind [
	"Set the builder as such that edge that are built and added in the view _behind_ the extremities of each edges"
	shouldMoveBehind := true
]

{ #category : #'private - utility' }
CAEdgeBuilder >> moveBehindIfNecessary: someEdges [
	shouldMoveBehind ifFalse: [ ^ self ].
	someEdges pushBack
]

{ #category : #initialization }
CAEdgeBuilder >> noRepetition [
	"
	Avoid having more than one edge between two elements

	b := RTMondrian new.
	b nodes: (1 to: 3).
	b shape line
		color: Color red trans;
		withVerticallAttachPoint.
	b edges noRepetition; useAssociations: { 1 -> 2 . 2 -> 3 . 1 -> 2}.
	b layout grid.
	b build.
	b view numberOfEdges
	"
	allowRepetition := false
]

{ #category : #'public - configuration' }
CAEdgeBuilder >> notUseInLayout [
	shouldNotBeUsedInLayout := false
]

{ #category : #accessing }
CAEdgeBuilder >> object: anObject [
	^ self objects: (Array with: anObject)
]

{ #category : #accessing }
CAEdgeBuilder >> objects: someObjectsOrABlock [
	"Identify the elements we are considering for the edge building process. Note that the view has to be set beforehand."
	self assert: [ viewHasBeenManuallySet ] description: 'A view has to be set, please use #view:'.
	self toObjects: someObjectsOrABlock.
	self fromObjects: someObjectsOrABlock.
]

{ #category : #'private - utility' }
CAEdgeBuilder >> processEdge: anEdge [
	actions do: [ :action | action value: anEdge ]
]

{ #category : #'private - utility' }
CAEdgeBuilder >> resetCreatedEdges [
	createdEdges := CAGroup new
]

{ #category : #accessing }
CAEdgeBuilder >> root: aRootElement [
	"Set the root element, in which elements will be looked up"
	viewHasBeenManuallySet := true.
	super root: aRootElement
]

{ #category : #'public repetition' }
CAEdgeBuilder >> shouldAllowRepetition [
	^ allowRepetition
]

{ #category : #testing }
CAEdgeBuilder >> shouldCreateEdgeFrom: fromElement to: toElement [
	"Return true if an edge has to be created"
	fromElement == toElement ifTrue: [ ^ false ].
	(fromElement isNil or: [ toElement isNil ]) ifTrue: [ ^ false ].
	allowRepetition ifFalse: [ ^ fromElement outgoingEdges noneSatisfy: [ :edge | edge to == toElement ] ].
	^ true
]

{ #category : #'public using source' }
CAEdgeBuilder >> source: objects connectFrom: fromblock to: toBlock [
	"Define some edges from objects that are not part of the view
	
nbOfNodes := 40.
nbOfRandomEdges := 40.

nodes := 1 to: nbOfNodes.
edges := (1 to: nbOfRandomEdges) 
				collect: [ :notUsed | nodes atRandom -> nodes atRandom ].

b := RTMondrian new.

b shape circle color: (Color black alpha: 0.5).
b nodes: nodes.

b shape line color: (Color gray alpha: 0.3).
b edges
	source: edges connectFrom: #key to: #value.

b layout force.
b
	"
	| assocs allObjects |
	self assert: [ objects notNil ] description: 'Cannot provide a nil value as the source'.
	self assert: [ objects isCollection ] description: 'Need to provide a collection as the source'.
	allObjects := Set new.
	
	assocs := objects collect: [ :o | 
		| f t |
		f := fromblock caValue: o.
		t := toBlock caValue: o.
		allObjects add: f; add: t.
		f -> t ].
	self objects: allObjects asArray.
	^ self useAssociations: assocs
]

{ #category : #'public using source' }
CAEdgeBuilder >> source: objects connectFrom: fromblock toAll: toBlock [
	"Define some edges from objects that are not part of the view
	
nbOfNodes := 40.
nbOfRandomEdges := 40.

nodes := 1 to: nbOfNodes.
edges := (1 to: nbOfRandomEdges) 
				collect: [ :notUsed | nodes atRandom -> {nodes atRandom . nodes atRandom} ].

b := RTMondrian new.

b shape circle color: (Color black alpha: 0.5).
b nodes: nodes.

b shape line color: (Color gray alpha: 0.3).
b edges
	source: edges connectFrom: #key toAll: #value.

b layout force.
b
	"
	| assocs allObjects |
	allObjects := Set new.

	assocs := objects flatCollect: [ :o | 
		| cc |
		cc := toBlock caValue: o.
		cc collect: [ :ccc | 
			| t |
			t := fromblock caValue: o.
			allObjects add: t; add: ccc.
			t -> ccc ] ].
	self objects: allObjects asArray.
	^ self useAssociations: assocs
]

{ #category : #'public using source' }
CAEdgeBuilder >> source: objects connectFromAll: fromBlock to: toBlock [
	"Define some edges from objects that are not part of the view
	
nbOfNodes := 40.
nbOfRandomEdges := 40.

nodes := 1 to: nbOfNodes.
edges := (1 to: nbOfRandomEdges) 
				collect: [ :notUsed | {nodes atRandom . nodes atRandom} -> nodes atRandom ].

b := RTMondrian new.

b shape circle color: (Color black alpha: 0.5).
b nodes: nodes.

b shape line color: (Color gray alpha: 0.3).
b edges
	source: edges connectFromAll: #key to: #value.

b layout force.
b
	"
	| assocs allObjects |
	allObjects := Set new.

	assocs := objects flatCollect: [ :o | 
		| cc |
		cc := fromBlock caValue: o.
		cc collect: [ :ccc | 
			| t |
			t := toBlock caValue: o.
			allObjects add: ccc; add: t.
			ccc -> t ] ].
	self objects: allObjects asArray.
	^ self useAssociations: assocs
]

{ #category : #accessing }
CAEdgeBuilder >> toElements [
	toElements ifNil: [ ^ self root elements ].
	^ toElements
]

{ #category : #accessing }
CAEdgeBuilder >> toElements: someElements [
	toElements := someElements
]

{ #category : #accessing }
CAEdgeBuilder >> toObject: anObject [
	^ self toObjects: (Array with: anObject)
]

{ #category : #accessing }
CAEdgeBuilder >> toObjects [
	"Return the list of objects considered as sources for the edges"
	^ self toElements collect: #caModel
]

{ #category : #accessing }
CAEdgeBuilder >> toObjects: someObjectsOrABlock [
	"Identify the elements we are considering for the edge building process. Note that the view has to be set beforehand."
	self assert: [ viewHasBeenManuallySet ] description: 'A view has to be set, please use #view:'.
	 
	(someObjectsOrABlock isCollection and: [ someObjectsOrABlock isSymbol not ])
		ifTrue: [ self toElements: (rootElement elementsFromModels: someObjectsOrABlock) ]
		ifFalse: [ self toElements: (rootElement elements select: [ :el | someObjectsOrABlock caValue: el caModel ]) ]
]

{ #category : #'public associations' }
CAEdgeBuilder >> useAssociation: assoc [
	"assoc have to be between model objects"
	self assert: [ assoc isKindOf: Association ] description: 'Please, provide an association instead'.
	self useAssociations: (Array with: assoc)
]

{ #category : #'public associations' }
CAEdgeBuilder >> useAssociations: associations [
	"associations have to be between model objects"
	
	"
	Here is an example
	
b := RTMondrian new.
b nodes: (1 to: 3).
b shape line
	color: Color red trans;
	withVerticallAttachPoint.
b edges noRepetition; useAssociations: { 1 -> 2 . 2 -> 3 . 1 -> 2}.
b layout grid.
b 

	"
	
	| fromElement toElement |
	createdEdges := CAGroup new.
	associations do: [ :assoc |
		fromElement := self fromElements elementFromModel: assoc key.
		toElement := self toElements elementFromModel: assoc value.
		(fromElement notNil and: [ toElement notNil ])
			ifTrue: [ self createEdgeIfNecessaryFrom: fromElement to: toElement ] ].
	self moveBehindIfNecessary: createdEdges.
	^ createdEdges
]

{ #category : #'public associations' }
CAEdgeBuilder >> useElementAssociations: associationsBetweenElements [
	associationsBetweenElements do: [ :assoc |
		self edgeFrom: assoc key to: assoc value ]
]
