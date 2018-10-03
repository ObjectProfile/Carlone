dependencies
release 
	super release.
	self commands do: #release.
	self commands: nil.
	self actions do: #release