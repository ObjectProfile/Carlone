compose examples
example01BasicCompose
	<script: 'self new example01BasicCompose inspect'>
	| data b color lb |
	data := CABasicExamples new esportPrizepool.
	
	b := CACompose new.
	color := CAScale category20.
	
	b objects: data associations forEach: [ :k | | pie |
		pie := CAPieBuilder new
			objects: k value;
			slice: #value.
		pie shape
			externalRadius: 180;
			innerRadius: 100;
			background: [ :obj | color scale: obj key ];
			segmentSpacing: 0.5.
		pie shape interaction popupText: [ :obj |
			obj value asStringWithCommas , '$, ' ,
			(obj value * 100 / pie totalSum) rounded asString, '%' ].
		pie label
			text: #key;
			rotated;
			offset: 0.
		pie ].
	lb := CALegendBuilder new.
	lb root @ CADraggable.
	lb addText: 'Money prices'.
	(data at: data keys first) do: [ :obj | 
		lb addColor: (color scale: obj key) text: obj key.
		].
	b addVisualization: lb.
	b build.
	^ b