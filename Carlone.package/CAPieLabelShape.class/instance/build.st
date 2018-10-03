public
build
	| elements |
	elements := self elementsOn: builder objects.
	elements doWithIndex: [ :t :i | | e |
		e := (builder elements at: i) geometry. 
		rotated ifTrue: [ | a |
			a := (e alphaAngle + e betaAngle)/2.
			(a > 90 and: [a < 270]) ifTrue: [ a := a - 180 ].
			t transform rotateBy: a negated; apply ].
		t computeLayout.
		t relocate: (e centro: offset) - t measuredBounds center + builder centerGap.
		 ].
	^ elements