pie - examples
example21PiePyramid
	
	<script: 'self new example21PiePyramid inspect'>
	| b data |
	data := { 
	{ 0.7. 'Sky'. Color lightBlue }.
	{0.2. 'Sunny side of pyramid'. Color yellow darker }.
	{ 0.05. 'Shady side of pyramid'. Color yellow muchDarker  } }.
	b := CAPieBuilder new.
	b 
		objects: data;
		slice: #first;
		start: -40.
	b shape interaction popupText: #second.
	b shape
		background: #third;
		externalRadius: 200.
	b build.
	^ b