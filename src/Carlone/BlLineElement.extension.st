Extension { #name : #BlLineElement }

{ #category : #'*Carlone' }
BlLineElement >> from [
	^ self fromAnchor referenceElement
]

{ #category : #'*Carlone' }
BlLineElement >> isUsedInLayout [
	"We will have to change this"
	^ true
]

{ #category : #'*Carlone' }
BlLineElement >> to [
	^ self toAnchor referenceElement
]
