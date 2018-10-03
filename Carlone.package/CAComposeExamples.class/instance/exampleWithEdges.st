lines
exampleWithEdges
	<script: 'self new exampleWithEdges inspect'>
	| c eb |
	c := CACompose new.
	c addAll: (CAGeometryShape box elementsOn: (1 to: 20)).
	c grid.
	c build.
	eb := CAEdgeBuilder new.
	eb root: c.
	eb objects: (2 to: 20).
	eb connectTo: [ :e | e - 1 ].
	^ c root