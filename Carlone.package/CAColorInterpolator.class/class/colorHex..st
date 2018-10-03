helpers
colorHex: arr
	^ arr collect: [ :value | Color colorFrom: (
		'#', (self hex: value >> 16),
		(self hex: value >> 8 & 255), 
		(self hex: value & 255))
		 ].
	