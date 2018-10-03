accessing
menuCommandOn: aBuilder
	<worldMenu>
	<worldMenuTest>
	(aBuilder item: #'How To Contribute')
			order: 0.002; 
			parent: self projectName asSymbol;
			label: 'How To report a bug';
			icon: (Smalltalk ui icons iconNamed: #smallDebug);
			action: [ self new open.  "WebBrowser openOn: 'https://github.com/ObjectProfile/Carlone'"  ]