"
I simply load the latest version of Carlone
"
Class {
	#name : #CALoadLatestVersion,
	#superclass : #CAAbstractWorldMenu,
	#category : #'Carlone-WorldMenu'
}

{ #category : #accessing }
CALoadLatestVersion class >> menuCommandOn: aBuilder [
	<worldMenu>
	<worldMenuTest>
	(aBuilder item: #'How To Contribute')
			order: 0.002; 
			parent: self projectName asSymbol;
			label: 'Load lastest version';
			icon: (Smalltalk ui icons iconNamed: #repair);
			action: [ self new loadLatestVersion ]
]

{ #category : #public }
CALoadLatestVersion >> loadLatestVersion [
	Gofer it
		smalltalkhubUser: 'ObjectProfile' project: 'Carlone';
		package: 'Carlone';
		load.
]
