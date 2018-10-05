Extension { #name : #Random }

{ #category : #'*Carlone' }
Random >> caNext: limit [
	^ self caNext: 0 and: limit.
]

{ #category : #'*Carlone' }
Random >> caNext: u and: v [
	^ CAScale linear range: {u. v}; scale: self next.
]
