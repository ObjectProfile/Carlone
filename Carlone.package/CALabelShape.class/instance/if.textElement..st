text
if: aBlockOrValue1 textElement: aBlockOrValue2
	| old |
	old := textElement.
	self textElement: [ :e | (aBlockOrValue1 caValue: e)
		ifTrue: [ aBlockOrValue2 caValue: e ]
		ifFalse: [ old caValue: e ] ]