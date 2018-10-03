accessing
domain: arr
	domain := OrderedCollection new.
	dictionary := Dictionary new.
	arr do: [ :xi |
		(dictionary includes: xi) ifFalse: [ 
			domain add: xi.
			dictionary at: xi put: domain size ] ].
	self perform: ranger withArguments: argument