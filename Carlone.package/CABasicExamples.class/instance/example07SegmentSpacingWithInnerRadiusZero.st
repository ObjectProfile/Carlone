pie - examples
example07SegmentSpacingWithInnerRadiusZero
	<script: 'self new example07SegmentSpacingWithInnerRadiusZero inspect'>
	| b |
	b := self createPieBuilder. 
	b shape 
		externalRadius: 240;
		"innerRadius: 0;"
		segmentSpacing: 5.
	b build.
	^ b