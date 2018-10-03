moz2d - examples
example01BasicCircularArcs
	<script: 'self new example01BasicCircularArcs inspect' >
	| canvas path |
	
	canvas := MozCanvas extent: 400 @ 400.
	path := canvas path
		moveTo: 80 @ 80;
		ellipticalArc2: 45 @ 45
			xrot: 0
			large: 0
			sweep: 0
			to: 125 @ 125;
		lineTo: 125 @ 80;
		close;
		build.
	canvas fill
		paint: Color green;
		path: path;
		draw.
	canvas stroke
		paint: Color black;
		path: path;
		draw.
	path := canvas path
		moveTo: 230 @ 80;
		ellipticalArc2: 45 @ 45
			xrot: 0
			large: 1
			sweep: 0
			to: 275 @ 125;
		lineTo: 275 @ 80;
		close;
		build.
	canvas fill
		paint: Color red;
		path: path;
		draw.
	canvas stroke
		paint: Color black;
		path: path;
		draw.
	path := canvas path
		moveTo: 80 @ 230;
		ellipticalArc2: 45 @ 45
			xrot: 0
			large: 0
			sweep: 1
			to: 125 @ 275;
		lineTo: 125 @ 230;
		close;
		build.
	canvas fill
		paint: Color purple;
		path: path;
		draw.
	canvas stroke
		paint: Color black;
		path: path;
		draw.
	path := canvas path
		moveTo: 230 @ 230;
		ellipticalArc2: 45 @ 45
			xrot: 0
			large: 1
			sweep: 1
			to: 275 @ 275;
		lineTo: 275 @ 230;
		close;
		build.
	canvas fill
		paint: Color blue;
		path: path;
		draw.
	canvas stroke
		paint: Color black;
		path: path;
		draw.
	^ canvas