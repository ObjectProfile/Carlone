Class {
	#name : #CAEdgeBuilderTest,
	#superclass : #CATest,
	#instVars : [
		'view',
		'elements',
		'b'
	],
	#category : #'Carlone-Tests'
}

{ #category : #running }
CAEdgeBuilderTest >> setUp [
	super setUp.
	
	view := CACompose new.
	elements := CAGeometryShape box elementsOn: (1 to: 30).
	view addAll: elements.
	view grid.

	b := CAEdgeBuilder new.
]

{ #category : #tests }
CAEdgeBuilderTest >> testAllowRepetitionAndUseAssociations [

	b := RTMondrian new.
	b nodes: (1 to: 3).
	b shape line
		color: Color red trans;
		withVerticallAttachPoint.
	b edges noRepetition; useAssociations: (Array with: 1 -> 2 with: 2 -> 3 with: 1 -> 2).
	b layout grid.
	b build.
	self assert: b view numberOfEdges equals: 2
]

{ #category : #tests }
CAEdgeBuilderTest >> testCompositeShapes [

	| els lineShape edges eb |
	view := RTView new.
	els := (RTBox new
		size: 10;
		color: Color blue;
		borderColor: Color veryLightGray)
		elementsOn: Collection withAllSubclasses.
	els @ RTDraggable.
	view addAll: els.
	lineShape := (RTLine new
				attachPoint: RTShorterDistanceAttachPoint new;
				color: Color veryDarkGray)
			+
					(RTSimpleArrowHead new
						attachPoint: RTShorterDistanceAttachPoint new;
						color: Color veryDarkGray).
	eb := CAEdgeBuilder new.
	eb
		view: view;
		objects: Collection withAllSubclasses;
		shape: lineShape.
	self assert: eb shape hasSetLineShape.

	edges := eb	connectFrom: #yourself toAll: #subclasses.
	RTTreeLayout on: els.
	
	
	self assert: (edges allSatisfy: [ :e | e shape == lineShape ])
]

{ #category : #tests }
CAEdgeBuilderTest >> testCompositeShapes02 [

	| els lineShape edges |
	view := RTView new.
	els := (RTBox new
		size: 10;
		color: Color blue;
		borderColor: Color veryLightGray)
		elementsOn: Collection withAllSubclasses.
	els @ RTDraggable.
	view addAll: els.
	lineShape := (RTLine new
				attachPoint: RTShorterDistanceAttachPoint new;
				color: Color veryDarkGray).
	edges := CAEdgeBuilder new
		view: view;
		objects: Collection withAllSubclasses;
		shape: lineShape;
		connectFrom: #yourself toAll: #subclasses.
	RTTreeLayout on: els.
	
	self assert: (edges allSatisfy: [ :e | e shape == lineShape ])
]

{ #category : #tests }
CAEdgeBuilderTest >> testConnectFrom [
	| e |
	b root: view.
	b objects: #(1 2).
	b connectFrom: [ :v | v - 1 ].
	
	self assert: view numberOfEdges equals: 1.
	
	e := view edges anyOne.
	self assert: e from caModel equals: 1.
	self assert: e to caModel equals: 2.
	
	self assert: e from outgoingEdges size equals: 1.
	self assert: e from outgoingEdges anyOne equals: e.
	
	self assert: e to incomingEdges size equals: 1.
	self assert: e to incomingEdges anyOne equals: e.
]

{ #category : #tests }
CAEdgeBuilderTest >> testConnectTo [
	| e |
	b root: view.
	b objects: #(1 2).
	b connectTo: [ :v | v - 1 ].
	
	self assert: view numberOfEdges equals: 1.
	
	e := view edges anyOne.
	self assert: e from caModel equals: 2.
	self assert: e to caModel equals: 1.
]

{ #category : #tests }
CAEdgeBuilderTest >> testConnectToAll [
	| eFrom eTo |
	b root: view.
	b objects: #(1 2 3).
	b connectToAll: [ :v | Array with: v - 1 with: v - 2 ].
	
	self assert: view numberOfEdges equals: 3.
	 
	eFrom := (view edges collect: [ :edge | edge from caModel ]) sorted asArray.
	eTo := (view edges collect: [ :edge | edge to caModel ]) sorted asArray.
	self assert: eFrom equals: #(2 3 3).
	self assert: eTo equals: #(1 1 2).
]

{ #category : #tests }
CAEdgeBuilderTest >> testDefault [
	self assert: view numberOfEdges equals: 0
]

{ #category : #tests }
CAEdgeBuilderTest >> testElements [

	| es |
	b := CAEdgeBuilder new.
	b root: view.
	self assert: b fromElements equals: view elements.
	
	es := CAGeometryShape box elementsOn: (1 to: 4).
	b elements: es.
	self assert: b fromElements equals: es.
]

{ #category : #tests }
CAEdgeBuilderTest >> testElementsToLookup [

	| es1 es2 edges |
	es1 := CAGeometryShape ellipse elementsOn: #(1 2 3).
	es2 := CAGeometryShape box elementsOn: #(1 2 3).
	edges := CAEdgeBuilder new
					fromElements: es1;
					toElements: es2;
					connectTo: #yourself.
	self assert: edges size equals: 3.
	
	self assert: edges first from equals: es1 first.
	self assert: edges first to equals: es2 first.
]

{ #category : #tests }
CAEdgeBuilderTest >> testFromAll [

	| v es |
	v := CACompose new.

	es := (CAGeometryShape ellipse size: 20) elementsOn: (1 to: 2).
	v addAll: es.
	
	self assert: v edges size equals: 0.
	CAEdgeBuilder new
		root: v;
		objects: (1 to: 2);
		connectFromAll: (Array with: 1) to: 2.

	es @ CAPopup.
	"RTTreeLayout on: es."

	self assert: v edges size equals: 1.
	self assert: v edges first from position equals: (15.0@15.0).
	self assert: v edges first to position equals: (15.0@55.0).
]

{ #category : #tests }
CAEdgeBuilderTest >> testFromObjects [
	"
	view := RTView new.
	elements := RTBox elementsOn: (1 to: 10).
	view addAll: elements. 
	b := RTEdgeBuilder new."

	| edges |
	b root: view.
	b fromObjects: #(1 2).
	b connectFrom: #yourself to: 10.
	self assert: view numberOfEdges equals: 2.
	edges := view edges.
	self assert: edges first from caModel equals: 1.
	self assert: edges first to caModel equals: 10.

	self assert: b toObjects asArray equals: (1 to: 10) asArray.
	self assert: b fromObjects asArray equals: #(1 2).
]

{ #category : #tests }
CAEdgeBuilderTest >> testFromObjects02 [
	"
	view := RTView new.
	elements := RTBox elementsOn: (1 to: 10).
	view addAll: elements. 
	b := RTEdgeBuilder new."
	
	b root: view.
	b fromObjects: #(1).
	b connectFrom: #yourself to: 10.
	self assert: view numberOfEdges equals: 1.

	self assert: b toObjects asArray equals: (1 to: 10) asArray.
	self assert: b fromObjects asArray equals: #(1).
]

{ #category : #tests }
CAEdgeBuilderTest >> testFromObjectsError [

"
view := RTView new.
	elements := RTBox elementsOn: (1 to: 10).
	view addAll: elements. 
	b := RTEdgeBuilder new."
	self should: [ CAEdgeBuilder new  fromObjects: #(1 2) ] raise: Error
]

{ #category : #tests }
CAEdgeBuilderTest >> testFromObjectsToElements [
	| edges |
	b root: view.
	edges := 
		b fromObjects: #(1 2);
			toElements: (elements copyFrom: 10 to: 10);
			connectTo: 10.
	self assert: edges size equals: 2.
]

{ #category : #tests }
CAEdgeBuilderTest >> testInit [
	| eb |
	eb := CAEdgeBuilder new.
	self deny: eb shouldAllowRepetition.
	eb allowRepetition.
	self assert: eb shouldAllowRepetition.
]

{ #category : #tests }
CAEdgeBuilderTest >> testLayout [

	| c l eb |
	c := CACompose new.

	c addAll: (CAGeometryShape box elementsOn: (Collection withAllSubclasses)).
	"c grid."
	l := RTTreeLayout new. 
	c root layout: (CARoassalLayout new layout: l).

	eb := CAEdgeBuilder new.
	eb root: c.
	eb connectFrom: #superclass.

	c elements @ CAPopup.

	c build
]

{ #category : #tests }
CAEdgeBuilderTest >> testNoMoveBehind [

	CAEdgeBuilder new
		root: view;
		useAssociations: (Array 
									with: 1 -> 2
									with: 2 -> 3
									with: 5 -> 6).
	self assert: (view canvas shapes collect: [ :c | c class name ]) asArray equals: #(#TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRLineShape #TRLineShape #TRLineShape)
]

{ #category : #tests }
CAEdgeBuilderTest >> testObjectFrom [
	| e |
	b root: view.
	b objects: #(1 2); connectFrom: [ :v | v - 1 ].
	
	self assert: view numberOfEdges equals: 1.
	
	e := view edges anyOne.
	self assert: e from caModel equals: 1.
	self assert: e to caModel equals: 2.
]

{ #category : #tests }
CAEdgeBuilderTest >> testObjectTo [
	| e |
	b root: view.
	b objects: #(1 2); connectTo: [ :v | v - 1 ].
	
	self assert: view numberOfEdges equals: 1.
	
	e := view edges anyOne.
	self assert: e from caModel equals: 2.
	self assert: e to caModel equals: 1.
]

{ #category : #tests }
CAEdgeBuilderTest >> testObjects [
	b root: view.
	b objects: (1 to: 5).
	self assert: b fromElements equals: (elements copyFrom: 1 to: 5)

"	view := RTView new.
	elements := RTBox elementsOn: (1 to: 10).
	view addAll: elements. 
	b := RTEdgeBuilder new."
]

{ #category : #tests }
CAEdgeBuilderTest >> testObjects02 [
	b root: view.
	b objects: #even.
	self assert: (b fromElements collect: #caModel) asArray equals: #(2 4 6 8 10)

"	view := RTView new.
	elements := RTBox elementsOn: (1 to: 10).
	view addAll: elements. 
	b := RTEdgeBuilder new."
]

{ #category : #tests }
CAEdgeBuilderTest >> testObjects03 [
	b root: view.
	b objects: #odd.
	self assert: (b fromElements collect: #caModel) asArray equals: #(1 3 5 7 9)

"	view := RTView new.
	elements := RTBox elementsOn: (1 to: 10).
	view addAll: elements. 
	b := RTEdgeBuilder new."
]

{ #category : #tests }
CAEdgeBuilderTest >> testSimple [

	CAEdgeBuilder new
		root: view;
		useElementAssociations: (Array 
									with: elements first -> elements second
									with: elements second -> elements third).
	self assert: view numberOfEdges equals: 2
]

{ #category : #tests }
CAEdgeBuilderTest >> testSimple2 [

	CAEdgeBuilder new
		root: view;
		useAssociations: (Array 
									with: 1 -> 2
									with: 2 -> 3
									with: 5 -> 6).
	self assert: view numberOfEdges equals: 3
]

{ #category : #tests }
CAEdgeBuilderTest >> testSimple3 [

	CAEdgeBuilder new
		root: view;
		fromObjects: #(1 2 3 6);
		toObjects: (1 to: 10);
		connectFrom: #yourself to: [ :v | v + 1 ].
	self assert: view numberOfEdges equals: 4.
	self assert: (view edges collect: [ :e | e from caModel -> e to caModel ]) asArray equals: ((Array new: 4) at: 1 put: (1->2); at: 2 put: (2->3); at: 3 put: (3->4); at: 4 put: (6->7); yourself)
]

{ #category : #tests }
CAEdgeBuilderTest >> testSimple4 [

	CAEdgeBuilder new
		root: view;
		fromObjects: #(1 2 3 6);
		toObjects: #(1 2 3 6);
		connectFrom: #yourself to: [ :v | v + 1 ].
	self assert: view numberOfEdges equals: 2.
	self assert: (view edges collect: [ :e | e from caModel -> e to caModel ]) asArray equals: ((Array new: 2) at: 1 put: (1->2); at: 2 put: (2->3); yourself)
]

{ #category : #tests }
CAEdgeBuilderTest >> testSimple5 [

	CAEdgeBuilder new
		root: view;
		fromObjects: #(1 2 3 6);
		connectFrom: #yourself toAll: [ :v | Array with: v + 1 with: v + 2 ].
		
	self assert: view numberOfEdges equals: 8.

]

{ #category : #tests }
CAEdgeBuilderTest >> testSimple6 [

	CAEdgeBuilder new
		root: view;
		fromObjects: (Array with: 2);
		connectFromAll: (Array with: 2) to: 3.
	self assert: view numberOfEdges equals: 1.

]

{ #category : #tests }
CAEdgeBuilderTest >> testSimple7 [

	CAEdgeBuilder new
		root: view;
		useAssociation: 1 -> 2;
		useAssociation: 2 -> 3;
		useAssociation: 5 -> 6.

	self assert: view numberOfEdges equals: 3
]

{ #category : #tests }
CAEdgeBuilderTest >> testSource [

	| v es eb c |
	v := CACompose new.
	es := CAGeometryShape box elementsOn: #(1 2 3). 
	v addAll: es.
	
	eb := CAEdgeBuilder new.
	eb root: v.
	
	c := OrderedCollection new.
	c add: 1 -> 2.
	c add: 3 -> 1.
	eb source: c connectFrom: #key to: #value.
	
	self assert: v numberOfEdges equals: 2
]

{ #category : #tests }
CAEdgeBuilderTest >> testToObjects [
	"
	view := RTView new.
	elements := RTBox elementsOn: (1 to: 10).
	view addAll: elements. 
	b := RTEdgeBuilder new."

	b root: view.
	b toObjects: #(1 2).
	b connectFrom: #yourself to: 10.
	self assert: view numberOfEdges equals: 0.

	self assert: b toObjects asArray equals: #(1 2).
	self assert: b fromObjects asArray equals: (1 to: 10) asArray.
]

{ #category : #'tests - use in layout' }
CAEdgeBuilderTest >> testUseInLayout [

	b
		view: view; 
		notUseInLayout; 
		connectTo: [ :v | v + 1 ].
	RTTreeLayout on: view elements.
	
	self assert: (view elements collect: #position) asArray equals: ((Array new: 10) at: 1 put: ((7.5@7.5)); at: 2 put: ((15.5@7.5)); at: 3 put: ((23.5@7.5)); at: 4 put: ((31.5@7.5)); at: 5 put: ((39.5@7.5)); at: 6 put: ((47.5@7.5)); at: 7 put: ((55.5@7.5)); at: 8 put: ((63.5@7.5)); at: 9 put: ((71.5@7.5)); at: 10 put: ((79.5@7.5)); yourself)
]

{ #category : #'tests - use in layout' }
CAEdgeBuilderTest >> testUseInLayoutDefault [

	b 
		view: view;
		connectTo: [ :v | v + 1 ].
	RTTreeLayout on: view elements.
	
	self assert: (view elements collect: #position) asArray equals: ((Array new: 10) at: 1 put: ((7.5@7.5)); at: 2 put: ((7.5@32.5)); at: 3 put: ((7.5@57.5)); at: 4 put: ((7.5@82.5)); at: 5 put: ((7.5@107.5)); at: 6 put: ((7.5@132.5)); at: 7 put: ((7.5@157.5)); at: 8 put: ((7.5@182.5)); at: 9 put: ((7.5@207.5)); at: 10 put: ((7.5@232.5)); yourself)
]

{ #category : #tests }
CAEdgeBuilderTest >> testWithMoveBehind [

	CAEdgeBuilder new
		root: view;
		moveBehind;
		useAssociations: (Array 
									with: 1 -> 2
									with: 2 -> 3
									with: 5 -> 6).
	self assert: (view canvas shapes collect: [ :c | c class name ]) asArray equals: #(#TRLineShape #TRLineShape #TRLineShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape)
]

{ #category : #tests }
CAEdgeBuilderTest >> testWithMoveBehind02 [

	CAEdgeBuilder new
		root: view;
		moveBehind;
		connectFrom: [ :v | v - 1 ].
	self assert: (view canvas shapes collect: [ :c | c class name ]) asArray equals: #(#TRLineShape #TRLineShape #TRLineShape #TRLineShape #TRLineShape #TRLineShape #TRLineShape #TRLineShape #TRLineShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape)
]

{ #category : #tests }
CAEdgeBuilderTest >> testconnectFromToAll [

	| es1 es2 edges |
	es1 := CAGeometryShape ellipse elementsOn: #(1 2 3).
	es2 := CAGeometryShape box elementsOn: #(1 2 3).
	edges := CAEdgeBuilder new
					fromElements: es1;
					toElements: es2;
					connectFrom: #yourself toAll: [ :obj | Array with: obj ].
	self assert: edges size equals: 3.
	
	self assert: edges first from equals: es1 first.
	self assert: edges first to equals: es2 first.
]
