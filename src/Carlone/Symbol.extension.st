Extension { #name : #Symbol }

{ #category : #'*Carlone' }
Symbol >> caValue: anObject [ 
	^ anObject perform: self
]
