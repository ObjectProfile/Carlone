tests - linear
testRandom
	"Random uses CAScale linear"
	| random value |
	random := SharedRandom globalGenerator.
	value := random caNext: 10.
	self assert: (value between: 0 and: 10).
	value := random caNext: -10 and: -5.
	self assert: (value between: -10 and: -5 ).