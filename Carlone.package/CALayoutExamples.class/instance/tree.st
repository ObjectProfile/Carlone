accessing
tree
	<script: 'self new tree inspect'>
	| c eb |
	c := CACompose new.

	c addAll: (CAGeometryShape box elementsOn: (Collection withAllSubclasses)).
	c treeLayout.

	eb := CAEdgeBuilder new.
	eb root: c.
	eb connectFrom: #superclass.

	c elements @ CAPopup.

	^ c 