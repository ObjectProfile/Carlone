tests
test01
	| easing |
	easing := BlEasingElastic2 new.
	self assert: (easing interpolate: 0) equals: 0.
	self assert: (easing interpolate: 0.5) equals: 0.9760611111525319.
	self assert: (easing interpolate: 1) equals: 0.9998304217014972.
	