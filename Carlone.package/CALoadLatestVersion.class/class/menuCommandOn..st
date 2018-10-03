accessing
menuCommandOn: aBuilder
	<worldMenu>
	<worldMenuTest>
	(aBuilder item: #'How To Contribute')
			order: 0.002; 
			parent: self projectName asSymbol;
			label: 'Load lastest version';
			icon: (Smalltalk ui icons iconNamed: #repair);
			action: [ self new loadLatestVersion ]