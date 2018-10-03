pie - examples
example20PieAndLegend
	
	<script: 'self new example20PieAndLegend inspect'>
	| root data color b title t1 t2 |
	root := BlElement new 
		background: (Color colorFrom: '#1a1b3a');
		size: 600@770.
	data := { 
		{ 'sleep'. 'I dream with my gf 8hrs'. 8 }.
		{ 'eat'. 'Sometimes I cook for 4hrs'. 3 }.
		{ 'work with smalltalk'. 'with Roassal & Carlone 8hrs'. 8 }.
		{ 'draw and play dota'. 'I draw with manga style and play dota in leyend level 4hrs'. 5} }.
		
	color := CAScale ordinal
		domain: data;
		range: ({ '#ae579c'. '#f28d1b'. '#e21454'. '#4cbcec' } collect: [ :c | Color colorFrom: c ]).
	b := CAPieBuilder new
		objects: data;
		slice: #third;
		centerGap: 100@20. "automatic in center?"
	b root: root.
	b shape
		externalRadius: 200;
		innerRadius: 140;
		background: color;
		segmentSpacing: 1.
	b label
		attributes: [ :obj | {
			BrTextForegroundAttribute paint: (color scale: obj).
			BrFontSizeAttribute size: 16.
			BrFontFamilyAttribute named: 'Helvetica'.} ];
		text: [ :obj | (obj third * 100 / b totalSum) rounded asString, '%' ].
	b label
		rotated;
		offset: 50. 
	b build.
	title := CALabelShape label
		attributes: [ :obj | {
			BrTextForegroundAttribute paint: Color white.
			BrFontSizeAttribute size: 30.
			BrFontFamilyAttribute named: 'Helvetica'.} ];
		text: #asUppercase.
		
	t1 := title elementOn: 'Milton'.
	t2 := title elementOn: 'Day'.
	t1 computeLayout.
	t2 computeLayout.
	t1 relocate: 300@200 - t1 measuredBounds center.
	t2 relocate: 300@240- t2 measuredBounds center.
	root addChild: t1; addChild: t2.
	
	b elements @ (CAPopup text: [:obj | obj first capitalized]).
	
	"lb := CALegendBuilder new.
	lb root background: Color transparent.
	root addChild: lb root.
	
	data do: [ :arr | 
		lb addRow: [ :row |
			row ellipse
				background: (color scale: arr).
			row title 
				text: arr first asUppercase;
				attributes: { BrTextForegroundAttribute paint: Color white }.
			row label
				text: arr second  ].
		 ]."
	
	^ root.