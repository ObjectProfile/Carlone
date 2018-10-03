public
connectTo: aBlockOrASymbol
	^ self connectFrom: [ :each | each ] to: aBlockOrASymbol