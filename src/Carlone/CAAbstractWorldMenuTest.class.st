"
I am a test class for the world menu of carlone
"
Class {
	#name : #CAAbstractWorldMenuTest,
	#superclass : #CATest,
	#category : #'Carlone-Tests'
}

{ #category : #tests }
CAAbstractWorldMenuTest >> testBasic [
	| morph |
	morph := (PragmaMenuBuilder pragmaKeyword: 'worldMenuTest' model: nil) menu popUpInWorld.
	morph delete.
]

{ #category : #tests }
CAAbstractWorldMenuTest >> testLogos [
	CALogos bigImage; mediumImage; smallImage.
]

{ #category : #tests }
CAAbstractWorldMenuTest >> testWoldMenuAbout [
	CAAbout new open
]

{ #category : #tests }
CAAbstractWorldMenuTest >> testWoldMenuHowToReportBug [
	CAHowToReportABug new open delete
]
