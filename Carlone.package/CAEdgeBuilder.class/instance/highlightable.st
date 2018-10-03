public - configuration
highlightable
	"Make the edges highlightable.
	Here is an example:
	
	| b edges |
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).

	b edges 
		moveBehind; 
		highlightable;
		connectFrom: [ :v | v // 2 ].

	b layout cluster.
	b

	"
	actions add: [ :edge | 
		edge @ RTHighlightable ] 