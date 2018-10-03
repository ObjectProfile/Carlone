Extension { #name : #BlGeometry }

{ #category : #'*Carlone' }
BlGeometry >> caHeight: aNumber [
	self extent: self extent x @ aNumber
]

{ #category : #'*Carlone' }
BlGeometry >> caWidth: aNumber [
	self extent: aNumber @ self extent y
]

{ #category : #'*Carlone' }
BlGeometry >> geometryExtent: anExtent [
	self matchExtent: anExtent
]
