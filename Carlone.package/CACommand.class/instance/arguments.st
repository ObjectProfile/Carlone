accessing - computed
arguments
	| args target |
	args := Array new: message arguments size.
	target := self argumentTarget.
	message arguments doWithIndex: [ :arg :index |
		args at: index put: (arg caValue: target) ].
	^ args