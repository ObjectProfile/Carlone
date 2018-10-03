tests
testLayout

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