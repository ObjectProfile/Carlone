examples
example01Basic
	<script: 'self new example01Basic inspect'>
	| b |
	b := CATreeMapBuilder new.
	b shape background: Color random.
	
	b from: (1 to: 5).
	b weight: #yourself.
	b build.
	^ b 