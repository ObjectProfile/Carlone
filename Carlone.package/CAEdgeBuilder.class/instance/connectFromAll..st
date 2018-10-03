public
connectFromAll: aFromBlockOrSymbol
	^ self connectFromAll: aFromBlockOrSymbol to: [ :each | each ]
