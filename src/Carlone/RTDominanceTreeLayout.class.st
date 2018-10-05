Class {
	#name : #RTDominanceTreeLayout,
	#superclass : #RTAbstractVerticalTreeLayout,
	#category : #'Carlone-Roassal-layouts'
}

{ #category : #'hook-private' }
RTDominanceTreeLayout >> computeChildrenFor: aNode [
	^ self childrenWithHighestNestingLevelFor: aNode
]
