*Carlone
arcCos: num
	| temp |
	temp := num.
	num < -1.0 ifTrue: [ temp := -1.0 ].
	num > 1.0 ifTrue: [ temp := 1.0 ].
	
	^ temp arcCos