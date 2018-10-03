hook
executeOnElements: elements
	"The argument is the set of Roassal elements"
	mockElements := elements collect: [ :e | RTMockElement new realElement: e ].
	super executeOnElements: mockElements.
	mockElements do: #applyToRealElement