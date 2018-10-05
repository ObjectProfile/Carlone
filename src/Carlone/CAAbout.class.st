"
I have a simple about of this project
"
Class {
	#name : #CAAbout,
	#superclass : #CAAbstractWorldMenu,
	#category : #'Carlone-WorldMenu'
}

{ #category : #accessing }
CAAbout class >> menuCommandOn: aBuilder [
	<worldMenu>
	<worldMenuTest>
	(aBuilder item: ('About ', self projectName) asSymbol)
			order: 0.001; 
			parent: self projectName asSymbol;
			label: 'About ', self projectName;
			icon: (Smalltalk ui icons iconNamed: #smallLanguageIcon);
			action: [ self new open ]
]

{ #category : #'instance creation' }
CAAbout >> open [
	self inform: 'Carlone is a data visualization engine for Pharo'.

]
