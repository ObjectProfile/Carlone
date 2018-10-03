helpers
scaleExtent: d
	| start stop |
	start := d first.
	stop := d last.
	^ start < stop
		ifTrue: [ Array with: start with: stop ]
		ifFalse: [ Array with: stop with: start ]