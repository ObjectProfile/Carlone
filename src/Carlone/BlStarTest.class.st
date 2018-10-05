"
I am a basic test BlStar
"
Class {
	#name : #BlStarTest,
	#superclass : #CATest,
	#instVars : [
		'star'
	],
	#category : #'Carlone-Tests'
}

{ #category : #tests }
BlStarTest >> testBasic [
	star := BlStar new.
	self assert: star vertices size equals: 10.
	star sides: 6.
	self assert: star vertices size equals: 12.
	star rotation: 10 "degree".
]
