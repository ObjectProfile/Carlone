as yet unclassified
doExecute: elements
	| thenElements elseElements |
	thenElements := CAGroup new.
	elseElements := CAGroup new.
	elements do: [ :anElement | (condition caValue: anElement) 
											ifTrue: [ thenElements add: anElement ] 
											ifFalse: [ elseElements add: anElement ] ].
	thenLayout on: thenElements.
	elseLayout on: elseElements.
	overallLayout on: (CAGroup with: thenElements with: elseElements)

