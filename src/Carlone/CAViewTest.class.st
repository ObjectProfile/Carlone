Class {
	#name : #CAViewTest,
	#superclass : #CATest,
	#category : #'Carlone-Tests'
}

{ #category : #tests }
CAViewTest >> testBasic01 [
	| view shape |
	view := CAView new.
	shape := CAGeometryBuilder box
		background: (Color red alpha: 0.2);
		size: #numberOfMethods.
	view addAll: (shape elementsOn: Collection withAllSubclasses).
	view container
]

{ #category : #tests }
CAViewTest >> testBasic02 [
	| view shape elements |
	view := CAView new.
	shape := CAGeometryBuilder rectangle
	size: #linesOfCode.
	shape interaction popupText: #name.
	elements := shape elementsOn: Collection withAllSubclasses.
	view layout grid.
	view addAll: elements.
	elements.
	view
]
