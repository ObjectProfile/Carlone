instance creation
open
	| play page |
	play := GTPlayground new. 
	page := GTPlayPage new
		saveContent: '"
Bug and issues can be reported to 
https://github.com/ObjectProfile/Carlone
"'; yourself.
	^ play openOn: page.
