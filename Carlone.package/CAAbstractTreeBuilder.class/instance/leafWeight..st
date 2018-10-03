weight
leafWeight: block
	self weightElement: [ :e | self calculateWeight: e using: block ].