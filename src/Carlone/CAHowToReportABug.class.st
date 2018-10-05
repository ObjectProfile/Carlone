"
I just show you how to report a bug in this pretty system
"
Class {
	#name : #CAHowToReportABug,
	#superclass : #CAAbstractWorldMenu,
	#category : #'Carlone-WorldMenu'
}

{ #category : #accessing }
CAHowToReportABug class >> menuCommandOn: aBuilder [
	<worldMenu>
	<worldMenuTest>
	(aBuilder item: #'How To Contribute')
			order: 0.002; 
			parent: self projectName asSymbol;
			label: 'How To report a bug';
			icon: (Smalltalk ui icons iconNamed: #smallDebug);
			action: [ self new open.  "WebBrowser openOn: 'https://github.com/ObjectProfile/Carlone'"  ]
]

{ #category : #'instance creation' }
CAHowToReportABug >> open [
	| play page |
	play := GTPlayground new. 
	page := GTPlayPage new
		saveContent: '"
Bug and issues can be reported to 
https://github.com/ObjectProfile/Carlone
"'; yourself.
	^ play openOn: page.

]
