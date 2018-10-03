pie - examples
example05SegmentSpacing
	<script: 'self new example05SegmentSpacing inspect'>
	| b |
	b := self createPieBuilder. 
	b shape 
		externalRadius: 240;
		innerRadius: 200;
		segmentSpacing: 1.
	b build.
	^ b