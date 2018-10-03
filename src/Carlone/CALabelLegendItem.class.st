Class {
	#name : #CALabelLegendItem,
	#superclass : #CALegendItem,
	#instVars : [
		'text',
		'model',
		'color'
	],
	#category : #'Carlone-Builder-Legend'
}

{ #category : #accessing }
CALabelLegendItem >> color [
	^ color
]

{ #category : #accessing }
CALabelLegendItem >> color: aColor [
	color := aColor
]

{ #category : #hooks }
CALabelLegendItem >> execute [

	| shape element |
	shape := CALabelShape label.
	shape text: text.
	element := shape elementOn: model.
	^ element
	"BlTextElement new
	text: ((BrRopedText string: 'bloc gallery 2')
		attributes: { 
			BrTextForegroundAttribute paint: (Color white alpha: 0.8).
			BrFontSizeAttribute size: 20.
			BrFontWeightAttribute weight: 50.
			BrFontFamilyAttribute named: 'Helvetica Neue'
		};
		yourself)
	yourself."
	
]

{ #category : #accessing }
CALabelLegendItem >> model [
	^ model
]

{ #category : #accessing }
CALabelLegendItem >> model: anObject [
	model := anObject
]

{ #category : #accessing }
CALabelLegendItem >> text [
	^ text
]

{ #category : #accessing }
CALabelLegendItem >> text: aTextOrSymbolOrBlock [
	text := aTextOrSymbolOrBlock
]

{ #category : #accessing }
CALabelLegendItem >> textColor [
	^ color
]
