lines
exampleWithLayoutBuilder
	<script: 'self new exampleWithLayoutBuilder inspect'>

	| c eb lb |
	c := CACompose new.
	c addAll: (CAGeometryShape box 
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