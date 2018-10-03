text
if: aBlockOrValue1 text: aBlockOrValue2
	self 
		if: [ :e | aBlockOrValue1 caValue: e caModel ] 
		textElement: [ :e | aBlockOrValue2 caValue: e caModel ].