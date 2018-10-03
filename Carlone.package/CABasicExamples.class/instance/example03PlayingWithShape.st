pie - examples
example03PlayingWithShape
	<script: 'self new example03PlayingWithShape inspect'>
	| b |
	b := self createPieBuilder. 
	b shape 
		externalRadius: 80;
		innerRadius: 50;
		border: (BlBorder paint: Color black);
		if: [ :cls | cls numberOfMethods > 100  ] actions: [ :s |
			s externalRadius: 90 ].
	b build.
	^ b