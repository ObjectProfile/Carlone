pie - examples
example04PieColors
	<script: 'self new example04PieColors inspect'>
	
	| b colors |
	b := self createPieBuilder. 
	colors := CAScale ordinal rangeFrom: #('#1f77b5' '#2ca02c' '#d62728' '#9467bd' '#7f7f7f').
	b shape 
		background: colors;
		externalRadius: 80;
		innerRadius: 50;
		onModel;
		if: [:m | m == String] actions: [ :s |
			s
				background: Color black;
				innerRadius: 20 ].
	b build.
	^ b