"
I am an abstract class to create visualizatations for trees collection data
"
Class {
	#name : #CAAbstractTreeBuilder,
	#superclass : #CABuilder,
	#instVars : [
		'elements',
		'rootNodes',
		'weight'
	],
	#category : #'Carlone-Core'
}

{ #category : #private }
CAAbstractTreeBuilder >> calculateWeight: e using: block [
	| w children |
	(e userData includesKey: #weight) 
		ifTrue: [ ^ e userData at: #weight ].
	
	children := e userData at: #children.
	
	children 
		ifEmpty: [ w := block caValue: e caModel ]
		ifNotEmpty: [ 
			w := children
				inject: 0 
				into: [ :s :el | s + (self calculateWeight: el using: block) ] ].
	w := w max: 1.
	e userData at: #weight put: w.
	^ w
]

{ #category : #private }
CAAbstractTreeBuilder >> createElements: atree nesting: block1 leaves: block2 depth: depth [
	| children e leaves |
	e := self shape elementOn: atree index: depth.
	self elements add: e.
	children := block1 caValue: atree.
	children := children collect: [ :child | | e2 |
		e2 := self 
			createElements: child 
			nesting: block1 
			leaves: block2 
			depth: depth + 1.
		e2 userData at: #parent put: e.
		e2 ] as: CAGroup.
	block2 ifNil: [ 
		e userData at: #children put: children.
		^ e ].
	leaves := (block2 caValue: atree) collect: [:child | | e2 |
		e2 := self shape elementOn: child index: depth + 1.
		self elements add: e2.
		e2 userData at: #parent put: e.
		e2 ] as: CAGroup.
	e userData at: #children put: children, leaves.
	^ e
		
	
]

{ #category : #accessing }
CAAbstractTreeBuilder >> elements [
	^ elements ifNil: [ elements := CAGroup new ].
]

{ #category : #building }
CAAbstractTreeBuilder >> explore: atree nesting: block1 leaves: block2 [
	^ (self from: (Array with: atree) nesting: block1 leaves: block2) first
]

{ #category : #building }
CAAbstractTreeBuilder >> explore: atree using: ablock [
	^ (self from: (Array with: atree) using: ablock ) first.
]

{ #category : #building }
CAAbstractTreeBuilder >> from: objects [
	^ self from: objects using: #()
]

{ #category : #building }
CAAbstractTreeBuilder >> from: objects nesting: block1 leaves: block2 [
	"objects a collection of trees"
	rootNodes := objects collect: [:obj | 
		self createElements: obj nesting: block1 leaves: block2 depth: 1 ].
	rootNodes do: [ :e | e userData at: #parent put: nil ].
	^ rootNodes
]

{ #category : #building }
CAAbstractTreeBuilder >> from: objects using: ablock [
	"objects a collection of trees"
	rootNodes := objects collect: [ :obj | 
		self createElements: obj nesting: ablock leaves: nil depth: 1 ].
	rootNodes do: [ :e | e userData at: #parent put: nil ].
	^ rootNodes
]

{ #category : #weight }
CAAbstractTreeBuilder >> leafWeight: block [
	self weightElement: [ :e | self calculateWeight: e using: block ].
]

{ #category : #accessing }
CAAbstractTreeBuilder >> rootNodes [
	^ rootNodes ifNil: [ rootNodes := CAGroup new ]
]

{ #category : #weight }
CAAbstractTreeBuilder >> weight: anObject [
	self weightElement: [ :e| anObject caValue: e caModel ].
]

{ #category : #weight }
CAAbstractTreeBuilder >> weightElement: block [
	"
	This builder uses weight variable do calculate the size of each rectangle
	weight block recives an element of the square and return a number
	self weightElement: [:element | 1 ]"
	weight := block
	
	
]

{ #category : #weight }
CAAbstractTreeBuilder >> weightOf: e [
	^ weight caValue: e
]
