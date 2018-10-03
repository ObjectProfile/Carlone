layout-utils
prepareElementsForLayout: elms inRectangle: rec
	| elementsArea viewArea area |
	elms isEmpty ifTrue: [ ^ elms ].
	elementsArea := elms 
		inject: 0 
		into: [ :s :e | s + (self weightOf: e) ].
	
	viewArea := rec width * rec height.
	elms do: [ :e|
		area := ((viewArea * (self weightOf: e))/elementsArea) asFloat.
		e userData at: #area put: area. ].
	
	^ elms