interpolation
interpolatorFor: b
	(b isString or: [ b isColor ]) ifTrue: [ ^ CAColorInterpolator ].
	b isNumber ifTrue: [ ^ CANumberInterpolator ].
	
	self error: 'Invalid value for interpolator'