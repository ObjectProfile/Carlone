"
A CAGroupTest is a test class for testing the behavior of CAGroup
"
Class {
	#name : #CAGroupTest,
	#superclass : #CATest,
	#category : #'Carlone-Tests'
}

{ #category : #tests }
CAGroupTest >> testElement [
	| g |
	g := CAGroup new.
	self assert: (g elementFromModel: 'foo') equals: nil.
	
	g add: (BlElement new caModel: 'bar'; yourself).
	self assert: (g elementFromModel: 'bar') notNil
]
