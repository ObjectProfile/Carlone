rendering
layoutArcs: aRootElement
	| max delta |
	"layout process"
	elements do: #computeLayout.
	max := elements first measuredExtent.
	elements do: [ :e | max := max max: e measuredExtent ].
	delta := 0@0.
	elements do: [ :e | | p |
		p := ( (max - e measuredExtent) /2) + (e userData at: #emphasize ifAbsent: [ 0 ]).
		delta := delta min: p.
		e relocate: p ].
	delta := delta - self centerGap.
	elements do: [ :e |
		e relocate: e measuredBounds position - delta ].