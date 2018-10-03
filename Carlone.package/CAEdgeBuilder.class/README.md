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