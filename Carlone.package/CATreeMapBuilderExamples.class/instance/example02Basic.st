examples
example02Basic
	<script: 'self new example02Basic inspect'>
	| b labels label |
	b := CATreeMapBuilder new.
	b shape background: Color veryLightGray.
	labels := #('uno' 'dos' 'tres' 'cuatro' 'cinco' 'Forrest Law'). 
	b from: labels.
	b weight: [:n| n size].
	b build.
	label := CALabelShape label.
	b elements do: [ :e | | lb | 
		lb := label elementOn: e caModel.
		e addChild: lb.
		lb computeLayout.
		lb relocate: (e measuredBounds extent - lb extent)/2 ].
	^ b 