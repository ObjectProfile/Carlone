examples
example04CollectionSubclasses
	<script: 'self new example04CollectionSubclasses inspect'>
	| b |
	b := CATreeMapBuilder new.
	b shape
		background: Color gray;
		border: (BlBorder builder paint: Color black; width: 0.5; build);
		if: [ :cls | (Smalltalk classNamed: cls name, 'Test') notNil ]
			background: Color green.
	b
		leafWeight: #linesOfCode;
		explore: Collection using: #subclasses;
		build.
	^ b