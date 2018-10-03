as yet unclassified
testBasic

	| v es |
	v := RTView new.
	es := RTBox elementsOn: (1 to: 10).
	v addAll: es.
	RTEdgeBuilder new
		view: v;
		connectFrom: [ :value | value // 2 ].
	RTSugiyamaLayout on: v elements.
	