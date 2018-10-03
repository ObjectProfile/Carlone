"
A ROTreeLayout is xxxxxxxxx.

"
Class {
	#name : #RTTreeLayout,
	#superclass : #RTAbstractVerticalTreeLayout,
	#category : #'Carlone-Roassal-layouts'
}

{ #category : #'hook-private' }
RTTreeLayout >> computeChildrenFor: aNode [
	^ self childrenFor: aNode except: alreadyLayoutedNodes
]
