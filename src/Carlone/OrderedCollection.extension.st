Extension { #name : #OrderedCollection }

{ #category : #'*Carlone' }
OrderedCollection >> asCAGroup [
	^ CAGroup withAll: self
]
