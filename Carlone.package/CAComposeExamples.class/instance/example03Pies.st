compose examples
example03Pies
	<script: 'self new example03Pies inspect'>
	| radius color view data labels maxSum padding label |
	data := CABasicExamples new usaPopulation.
	labels := data first.
	maxSum := 0.
	data := (data allButFirst collect: [ :line | | arr sum |
		arr :=  Array new: line size.
		sum := 0.
		2 to: line size do: [ :n | | v |
			v := (line at: n) asNumber.
			sum := sum + v.
			arr at: n put: v ].
		arr at: 1 put: line first -> sum.
		maxSum := maxSum max: sum.
		arr ]) sorted: [:a :b | a first value > b first value ] .
	
	padding := 10.
	radius := CAScale sqrt 
		domain: { 0. maxSum};
		range: #(0 220).
	color := CAScale sky8.
	
	view := CACompose new.
	view root layout: BlFlowLayout new horizontal.
	label := CALabelShape label.
	data do: [ :line | | b r |
		b := CAPieBuilder new
			objects: line allButFirst.
		r := (radius scale: line first value) asFloat.
		b root 
			background: Color transparent;
			size: (r + padding) * 2 asPoint.
		b shape
			externalRadius: r;
			innerRadius: r * 0.6;
			backgroundElement: [:e | color scale: e caIndex ];
			segmentSpacing: 0.5.
		b centerGap: (padding /2) asPoint.
		view addVisualization: b.
		].
	view root @ CADraggable.
	^ view