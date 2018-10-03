accessing
labelElement: oneArgBlock
	"Method useful to label edges. The argument is a one arg block that accept the edge. The block has to return a String that will be used to label the edge.
	
	Here is an example:
	| b edges |
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).

	b edges 
		moveBehind; 
		highlightable;
		labelElement: [ :anEdge | anEdge from model asString, '>', anEdge to model asString ];
		connectFrom: [ :v | v // 2 ].

	b layout cluster.
	b
	"
	^ self labelElement: oneArgBlock fontSize: TRLabelShape defaultFontSize