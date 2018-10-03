pie - examples
example02EmphasizeArc
	<script: 'self new example02EmphasizeArc inspect' >
	| b |
	b := self createPieBuilder. 
	b emphasize: Array by: 20.
	b build.
	^ b