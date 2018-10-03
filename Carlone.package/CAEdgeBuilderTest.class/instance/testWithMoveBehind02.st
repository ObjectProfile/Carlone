tests
testWithMoveBehind02

	CAEdgeBuilder new
		root: view;
		moveBehind;
		connectFrom: [ :v | v - 1 ].
	self assert: (view canvas shapes collect: [ :c | c class name ]) asArray equals: #(#TRLineShape #TRLineShape #TRLineShape #TRLineShape #TRLineShape #TRLineShape #TRLineShape #TRLineShape #TRLineShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape #TRBoxShape)