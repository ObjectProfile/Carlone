Class {
	#name : #CAInteractionTest,
	#superclass : #CATest,
	#category : #'Carlone-Tests'
}

{ #category : #tests }
CAInteractionTest >> testPopup [
	| r b |
	r := Random new.
	b := CAPieBuilder new.
	b objects: ((Collection withAllSubclasses first: 50) sorted: [ :e1 :e2 | e1 numberOfMethods > e2 numberOfMethods ]).
	b slice: #numberOfMethods.
	b shape
		innerRadius: 0;
		externalRadius: 200;
		border:
			(BlBorder builder
				paint: Color black;
				width: 1.5;
				build).
	b build.
	b elements @ CAPopup
]
