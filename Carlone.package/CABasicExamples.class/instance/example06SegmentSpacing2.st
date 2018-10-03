pie - examples
example06SegmentSpacing2
	<script: 'self new example06SegmentSpacing2 inspect'>
	| b |
	b := self createPieBuilder2. 
	b shape 
		externalRadius: 240;
		innerRadius: 20;
		segmentSpacing: 2;
		border: (BlBorder builder paint: Color black; width: 1.5; build).
	b build.
	^ b