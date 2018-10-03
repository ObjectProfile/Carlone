public
edgeFrom: source to: target 
	"source and target are elements"
	| newEdge |
	newEdge := BlLineElement new
		zIndex: 10;
		border: (BlBorder paint: Color red width: 2);
		yourself.
	
	newEdge fromAnchor: (BlElementBottomCenterAnchor element: source).
	newEdge toAnchor: (BlElementBottomCenterAnchor element: target).

	target addIncomingEdge: newEdge.
	source addOutgoingEdge: newEdge.

	rootElement addChild: newEdge.
	^ newEdge