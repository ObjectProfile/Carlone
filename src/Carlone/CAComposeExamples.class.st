"
Basic examples for compose
"
Class {
	#name : #CAComposeExamples,
	#superclass : #CAAbstractExamples,
	#category : #'Carlone-Examples'
}

{ #category : #'test basic' }
CAComposeExamples >> basic01 [
	<script: 'self new basic01 inspect'>
	| ca |
	ca := CACompose new.
	ca addAll: (CAGeometryBuilder box elementsOn: (1 to: 30)).
	ca grid.
	^ ca 
]

{ #category : #'test basic' }
CAComposeExamples >> basic02 [
	<script: 'self new basic02 inspect'>
	| ca boxes |
	ca := CACompose new.
	boxes := CAGeometryBuilder box elementsOn: (1 to: 30).
	boxes @ CAPopup.
	ca addAll: boxes.
	ca grid.
	^ ca
]

{ #category : #'compose examples' }
CAComposeExamples >> example01BasicCompose [
	<script: 'self new example01BasicCompose inspect'>
	| data b color lb |
	data := CABasicExamples new esportPrizepool.
	
	b := CACompose new.
	color := CAScale category20.
	
	b objects: data associations forEach: [ :k | | pie |
		pie := CAPieBuilder new
			objects: k value;
			slice: #value.
		pie shape
			externalRadius: 180;
			innerRadius: 100;
			background: [ :obj | color scale: obj key ];
			segmentSpacing: 0.5.
		pie shape interaction popupText: [ :obj |
			obj value asStringWithCommas , '$, ' ,
			(obj value * 100 / pie totalSum) rounded asString, '%' ].
		pie label
			text: #key;
			rotated;
			offset: 0.
		pie ].
	lb := CALegendBuilder new.
	lb root @ CADraggable.
	lb addText: 'Money prices'.
	(data at: data keys first) do: [ :obj | 
		lb addColor: (color scale: obj key) text: obj key.
		].
	b addVisualization: lb.
	b build.
	^ b
]

{ #category : #'compose examples' }
CAComposeExamples >> example02BasicComposeWithLayout [
	<script: 'self new example02BasicComposeWithLayout inspect'>
	| v box blueBox elements first second l |
	v := CACompose new.
	
	box := CAGeometryBuilder box
		size: #yourself;
		background: Color lightGray;
		onElement;
		when: [ :e | e caModel = 120 
			ifTrue: [ BlMouseEnterEvent  ] 
			ifFalse: [ BlDoubleClickEvent ] ]  
		do: [ :e | [ :evt | e background: Color random ] ].
	box interaction popup.
	box layout grid 
		vertical;
		rowCount: 15.
	elements := box
		elementsOn: (10 to: 200 by: 10)
		forEach: [ :aNumber | 
			blueBox := CAGeometryBuilder box
				size: 5;
				background: Color blue.
			blueBox interaction popup.
			blueBox elementsOn: (1 to: aNumber) ].
	v addAll: elements.
	v root @ CADraggable.
	v grid.
	first := elements elementFromModel: 100.
	second := elements elementFromModel: 160.
	l := BlLineElement new
		fromAnchor: (BlElementCenterAnchor element: first);
		toAnchor: (BlElementCenterAnchor element: second);
		border: (BlBorder paint: Color red width: 4);
		yourself.
	v addChild: l.
	^ v
]

{ #category : #'compose examples' }
CAComposeExamples >> example03Pies [
	<script: 'self new example03Pies inspect'>
	| radius color view data labels maxSum padding label |
	data := CABasicExamples new usaPopulation.
	labels := data first.
	maxSum := 0.
	data := (data allButFirst collect: [ :line | | arr sum |
		arr :=  Array new: line size.
		sum := 0.
		2 to: line size do: [ :n | | v |
			v := (line at: n) asNumber.
			sum := sum + v.
			arr at: n put: v ].
		arr at: 1 put: line first -> sum.
		maxSum := maxSum max: sum.
		arr ]) sorted: [:a :b | a first value > b first value ] .
	
	padding := 10.
	radius := CAScale sqrt 
		domain: { 0. maxSum};
		range: #(0 220).
	color := CAScale sky8.
	
	view := CACompose new.
	view root layout: BlFlowLayout new horizontal.
	label := CALabelShape label.
	data do: [ :line | | b r |
		b := CAPieBuilder new
			objects: line allButFirst.
		r := (radius scale: line first value) asFloat.
		b root 
			background: Color transparent;
			size: (r + padding) * 2 asPoint.
		b shape
			externalRadius: r;
			innerRadius: r * 0.6;
			onElement;
			background: [:e | color scale: e caIndex ];
			segmentSpacing: 0.5.
		b centerGap: (padding /2) asPoint.
		view addVisualization: b.
		].
	view root @ CADraggable.
	^ view
]

{ #category : #lines }
CAComposeExamples >> exampleWithEdges [
	<script: 'self new exampleWithEdges inspect'>
	| c eb |
	c := CACompose new.
	c addAll: (CAGeometryBuilder box elementsOn: (1 to: 20)).
	c grid.
	c build.
	eb := CAEdgeBuilder new.
	eb root: c.
	eb objects: (2 to: 20).
	eb connectTo: [ :e | e - 1 ].
	^ c root
]

{ #category : #lines }
CAComposeExamples >> exampleWithLayoutBuilder [
	<script: 'self new exampleWithLayoutBuilder inspect'>

	| c eb lb |
	c := CACompose new.
	c addAll: (CAGeometryBuilder box 
					"size: #numberOfMethods;"
					elementsOn: (Collection withAllSubclasses)).

	eb := CAEdgeBuilder new.
	eb root: c.
	eb objects: (Collection withAllSubclasses).
	eb connectFrom: #superclass.
	
	lb := CALayBuilder new.
	lb tree.
	lb setUpContainer: c root.

	^ c.
]
