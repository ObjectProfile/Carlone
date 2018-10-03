examples
example03TreemapNumbers
	<script: 'self new example03TreemapNumbers inspect'>
	| b |
	b := CATreeMapBuilder new.
	b shape 
		background: Color gray;
		if: #even background: Color veryLightGray.
	b 
		extent: 400 asPoint;
		explore: 1
			using: [ :n | n < 8 
				ifTrue: [ Array with: n + 1 with:  n + 2 ] 
				ifFalse: [ #() ] ];
		weight: #yourself.
	b build.

	^ b 