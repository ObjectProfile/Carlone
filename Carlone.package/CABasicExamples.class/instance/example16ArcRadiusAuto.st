pie - examples
example16ArcRadiusAuto
	<script: 'self new example16ArcRadiusAuto inspect'>
	| b |
	b := CAPieBuilder new.
	b objects: #(1 1 2 3 5 8 13 21).
	b arcRadiusAuto.
	b shape
		innerRadius: 100;
		externalRadius: 220";
		cornerRadius: 30".
	b build.
	^ b