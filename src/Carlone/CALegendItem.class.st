Class {
	#name : #CALegendItem,
	#superclass : #CAObject,
	#instVars : [
		'textSize'
	],
	#category : #'Carlone-Builder-Legend'
}

{ #category : #hooks }
CALegendItem >> execute [
	self subclassResponsibility
]

{ #category : #initialization }
CALegendItem >> initialize [
	super initialize.
	"self textSize: TRLabelShape defaultFontSize."
]

{ #category : #utility }
CALegendItem >> newLabelShape: widthDescription [
	"Return a new label with the argument as the content of the label"
	^ RTLabel new color: self textColor; text: widthDescription; height: textSize; yourself
]

{ #category : #utility }
CALegendItem >> textColor [
	^ Color lightGray
]

{ #category : #accessing }
CALegendItem >> textSize [
	^ textSize
]

{ #category : #accessing }
CALegendItem >> textSize: anObject [
	textSize := anObject
]
