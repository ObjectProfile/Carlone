test basic
basic01
	<script: 'self new basic01 inspect'>
	| ca |
	ca := CACompose new.
	ca addAll: (CAGeometryShape box elementsOn: (1 to: 30)).
	ca grid.
	^ ca 