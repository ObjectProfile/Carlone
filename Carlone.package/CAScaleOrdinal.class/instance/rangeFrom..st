accessing
rangeFrom: array
	self range: (array collect: [ :val | Color colorFrom: val ])