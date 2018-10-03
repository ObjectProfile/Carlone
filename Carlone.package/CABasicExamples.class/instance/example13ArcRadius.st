pie - examples
example13ArcRadius
	<script: 'self new example13ArcRadius inspect'>
	| b |
	b := CAPieBuilder new.
	b objects: #(1 1 2 3 5 8 13 21).
	
	b shape
		innerRadius: 220/ 3;
		externalRadius: 220;
		background: Color lightGray;
		border: (BlBorder builder paint: Color black; width: 1.5; build);
		cornerRadius: 30.
	b build.
	^ b