private
update: object keys: keys element: element
	keys ifNil: [ ^ self ].
	keys do: [ :k | | args res |
		
		args := globalAttributes at: k.
		res := Array new: args size.
		args doWithIndex: [ :arg :in | 
			res at: in put: (arg caValue: element).
			 ].
		object perform: k withArguments: res.
		 ].