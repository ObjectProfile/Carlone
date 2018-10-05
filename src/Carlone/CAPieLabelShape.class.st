"
I can create labels for a pie builder and set the position acording to ac
"
Class {
	#name : #CAPieLabelShape,
	#superclass : #CALabelShape,
	#instVars : [
		'rotated',
		'offset',
		'builder',
		'start'
	],
	#category : #'Carlone-Builder-Pie'
}

{ #category : #public }
CAPieLabelShape >> build [
	| elements |
	elements := self elementsOn: builder objects.
	elements doWithIndex: [ :t :i | | e |
		e := (builder elements at: i) geometry. 
		rotated ifTrue: [ | a |
			a := (e alphaAngle + e betaAngle)/2.
			(a > 90 and: [a < 270]) ifTrue: [ a := a - 180 ].
			t transform rotateBy: a negated; apply ].
		t computeLayout.
		t relocate: (e centro: offset) - t measuredBounds center + builder centerGap.
		 ].
	^ elements
]

{ #category : #accessing }
CAPieLabelShape >> builder: aPieBuilder [
	builder := aPieBuilder
]

{ #category : #initialization }
CAPieLabelShape >> initialize [
	super initialize.
	offset := 0.
	rotated := false.
]

{ #category : #testing }
CAPieLabelShape >> isRotated [
	^ rotated
]

{ #category : #accessing }
CAPieLabelShape >> offset [
	^ offset
]

{ #category : #accessing }
CAPieLabelShape >> offset: aNumber [
	offset := aNumber
]

{ #category : #accessing }
CAPieLabelShape >> rotated [
	rotated := true.
]
