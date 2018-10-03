accessing
domain: arr
	positive := arr first >= 0.
	domain := arr.
	linear domain: (arr collect: [:n | self lg: n]).