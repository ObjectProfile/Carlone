"
A ROHorizontalTreeLayout is xxxxxxxxx.

"
Class {
	#name : #RTHorizontalTreeLayout,
	#superclass : #RTAbstractHorizontalTreeLayout,
	#category : #'Carlone-Roassal-layouts'
}

{ #category : #'hook-private' }
RTHorizontalTreeLayout >> computeChildrenFor: aNode [
	^ self childrenFor: aNode except: alreadyLayoutedNodes
]
