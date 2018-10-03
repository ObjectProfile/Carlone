hooks
backgroundBoxElement
	| e |
	e := self backgroundShape elementOn: nil.
	self interaction setUpElement: e.
	^ e