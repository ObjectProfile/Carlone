tests
testBasic
	| layout |
	layout := RTTreeLayout new.
	self assert: layout shouldSetDefaultAttachPoint.
	layout doNotAttachPoint.
	self deny: layout shouldSetDefaultAttachPoint.