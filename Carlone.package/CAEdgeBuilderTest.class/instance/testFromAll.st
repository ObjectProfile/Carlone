tests
testFromAll

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