pie - examples
example22Clockwise
	
	<script: 'self new example22Clockwise inspect'>
	| b |
	b := self createPieBuilder2.
	b shape interaction popup.
	b start: -90.
	b shape
		onElement;
		background: CAScale category20;
		externalRadius: 200;
		alphaAngle: [ :e | (b outerAngleFor: e) negated ];
		betaAngle: [:e | (b innerAngleFor: e) negated ].
	b build.
	^ b