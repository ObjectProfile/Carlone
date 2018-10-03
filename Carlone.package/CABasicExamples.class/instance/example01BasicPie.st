pie - examples
example01BasicPie
	<script: 'self new example01BasicPie inspect' >
	| b |
	b := self createPieBuilder. 
	b build.
	^ b