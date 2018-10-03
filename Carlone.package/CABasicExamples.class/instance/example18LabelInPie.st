pie - examples
example18LabelInPie
	<script: 'self new example18LabelInPie inspect'>
	| data builder color |
	"source https://www.indexmundi.com/bolivia/age_structure.html"
	data := { 
		'<=14'->3547498.
		'15-24'->2168047. 
		'25-54'->4174931. 
		'55-64'->657007. 
		'>=65'->590751}.
	"---CARLONE---"
	color := CAScale category20.
	builder := CAPieBuilder new
		objects: data;
		slice: #value;
		centerGap: 10 asPoint.
	builder shape 
		externalRadius: 240;
		innerRadius: 170;
		background: color;
		segmentSpacing: 0.4.
	builder label 
		fontSize: 13;
		fontFamily: 'Courier';
		text: [:obj | obj key,', ',
			(obj value * 100 / builder totalSum) rounded asString, '%' ].
	builder build.
	^ builder