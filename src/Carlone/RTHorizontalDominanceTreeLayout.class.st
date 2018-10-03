Class {
	#name : #RTHorizontalDominanceTreeLayout,
	#superclass : #RTAbstractHorizontalTreeLayout,
	#category : #'Carlone-Roassal-layouts'
}

{ #category : #'hook-private' }
RTHorizontalDominanceTreeLayout >> computeChildrenFor: aNode [
	^ self childrenWithHighestNestingLevelFor: aNode
]
