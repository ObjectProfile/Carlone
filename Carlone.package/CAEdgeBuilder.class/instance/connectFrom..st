public
connectFrom: aBlockOrASymbol
	^ self connectFrom: aBlockOrASymbol to: [ :each | each ]