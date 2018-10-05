"
Examples about the layouts
"
Class {
	#name : #CALayoutExamples,
	#superclass : #CAAbstractExamples,
	#category : #'Carlone-Examples'
}

{ #category : #accessing }
CALayoutExamples >> tree [
	<script: 'self new tree inspect'>
	| c eb |
	c := CACompose new.

	c addAll: (CAGeometryBuilder box elementsOn: (Collection withAllSubclasses)).
	c treeLayout.

	eb := CAEdgeBuilder new.
	eb root: c.
	eb connectFrom: #superclass.

	c elements @ CAPopup.

	^ c 
]
