tests - reversed
testVerticallyReversed
	| layout v edge lineShape elements |
	
	v := RTView new.
	elements := RTBox elementsOn: (1 to: 3).
	v addAll: elements.
	lineShape := RTLine new.
	edge := lineShape edgeFrom: elements first to: elements second.
	v add: edge.
	edge := lineShape edgeFrom: elements first to: elements third.
	v add: edge.
	layout := RTTreeLayout new.
	
	"NO REVERSE"
	layout on: elements.
	self assert: elements second position y > elements first position y.
	self assert: elements second position x < elements first position x.
	self assert: elements second position y equals: elements third position y.
	
	"REVERSE"
	layout verticallyReverse.
	layout on: elements.
	self assert: elements second position y < elements first position y.
	self assert: elements second position x < elements first position x.
	self assert: elements second position y equals: elements third position y.
	
	"ATTACHPOINT"
	self assert: (v edges collect: [ :ed | ed shape attachPoint ]) asSet size equals: 1.