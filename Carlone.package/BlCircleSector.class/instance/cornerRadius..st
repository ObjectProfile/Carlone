accessing
cornerRadius: aNumber
	self 
		assert: [ aNumber >= 0 ]
		description: 'Corner radius must be a non-negative!'.
	cornerRadii := aNumber "BlCornerRadii todo for future".  