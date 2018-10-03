"
I have the interactions for the world menu
"
Class {
	#name : #CAAbstractWorldMenu,
	#superclass : #Object,
	#category : #'Carlone-WorldMenu'
}

{ #category : #accessing }
CAAbstractWorldMenu class >> image [ 
	^ CALogos smallImage
]

{ #category : #accessing }
CAAbstractWorldMenu class >> menuCommandOn: aBuilder [
	<worldMenu>
	<worldMenuTest>
	((aBuilder item: self projectName) icon: self image)
	withSeparatorAfter
]

{ #category : #accessing }
CAAbstractWorldMenu class >> projectName [
	^ 'Carlone'
]
