Extension { #name : #BlElement }

{ #category : #'*Carlone' }
BlElement >> @ anInteraction [
	anInteraction onElement: self
]

{ #category : #'*Carlone' }
BlElement >> addIncomingEdge: anEdge [
	self incomingEdges add: anEdge
]

{ #category : #'*Carlone' }
BlElement >> addOutgoingEdge: anEdge [
	self outgoingEdges add: anEdge
]

{ #category : #'*Carlone' }
BlElement >> caIndex [
	^ self userData at: #index
]

{ #category : #'*Carlone' }
BlElement >> caIndex: index [
	self userData at: #index put: index
]

{ #category : #'*Carlone' }
BlElement >> caModel [
	^ self userData at: #model
]

{ #category : #'*Carlone' }
BlElement >> caModel: anObject [
	self userData at: #model put: anObject
]

{ #category : #'*Carlone' }
BlElement >> encompassingRectangle [
	^ self bounds
]

{ #category : #'*Carlone' }
BlElement >> incomingEdges [
	^ self userData at: #incomingEdges ifAbsentPut: [ OrderedCollection new ]
]

{ #category : #'*Carlone' }
BlElement >> isConnected [
	"Return true if the element is connected to at least one element (which would be itself)"
	"An element is connected if it has at least one incoming or outgoing edge"
	^ self incomingEdges notEmpty or: [ self outgoingEdges notEmpty ]
]

{ #category : #'*Carlone' }
BlElement >> outgoingEdges [
	^ self userData at: #outgoingEdges ifAbsentPut: [ OrderedCollection new ]
]

{ #category : #'*Carlone' }
BlElement >> pushBack [
	self hasParent 
		ifFalse: [ ^ self  ].

	self parent
		removeChild: self;
		addChildFirst: self.
		
]

{ #category : #'*Carlone' }
BlElement >> translateBy: aDelta [

	self transform
		inherit;
		origin: (BlAffineTransformationPositionOrigin position: 0@0);
		translateBy: (BlVector x: aDelta asPoint x y: aDelta asPoint y z: 0);
		apply
]
