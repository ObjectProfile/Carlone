accessing
execute
	| target arguments |
	target := self target.
	arguments := self arguments.
	target perform: self message selector withArguments: arguments.
	^ arguments.