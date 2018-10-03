"
A BlArcTest is a test class for testing the behavior of BlArc
"
Class {
	#name : #BlCircleSectorTest,
	#superclass : #CATest,
	#instVars : [
		'arc'
	],
	#category : #'Carlone-Tests'
}

{ #category : #initialization }
BlCircleSectorTest >> setUp [
	arc := BlCircleSector new
		alphaAngle: 0;
		betaAngle: 360;
		innerRadius: 0;
		externalRadius: 100.
]

{ #category : #tests }
BlCircleSectorTest >> testArcCorner [
	self assert: (arc 
		arcCornerTangets: -17.172947580489485@ -71.29423293069038
		p1: -58.258908750504766 @ -212.1459392757739
		r: 220
		rc: 11.316433244555238
		cw: true)
		
		equals: (-54.9506649278924@ 200.80455223867077) -> (-46.47771241701749@ 215.03446758248086)
]

{ #category : #tests }
BlCircleSectorTest >> testBasic [
	self assert: arc innerRadius equals: 0.
	self assert: arc externalRadius equals: 100.
	self assert: arc extent equals: 200@200
]

{ #category : #tests }
BlCircleSectorTest >> testCentro [
	self assert: (arc centro: 0) equals: (50.0@100.0)
]

{ #category : #tests }
BlCircleSectorTest >> testContainsPoint [
	| element |
	element := arc asElement.
	self assert: (arc containsPoint: 0@0 in: element).
]

{ #category : #tests }
BlCircleSectorTest >> testDrawingWithSparta01 [
	arc buildPathOnSpartaCanvas: Bloc preferableSpartaCanvas offscreen.
]

{ #category : #tests }
BlCircleSectorTest >> testDrawingWithSparta02 [
	"Test for arc padding"
	arc 
		alphaAngle: 30;
		betaAngle: 90;
		segmentSpacing: 5.
	arc buildPathOnSpartaCanvas: Bloc preferableSpartaCanvas offscreen.
]

{ #category : #tests }
BlCircleSectorTest >> testDrawingWithSparta03 [
	"Test for donut"
	arc 
		externalRadius: 100;
		innerRadius: 50;
		alphaAngle: 0;
		betaAngle: 360.
	arc buildPathOnSpartaCanvas: Bloc preferableSpartaCanvas offscreen.
]

{ #category : #tests }
BlCircleSectorTest >> testDrawingWithSparta04 [
	"Test for circle"
	arc 
		externalRadius: 100;
		innerRadius: 0;
		alphaAngle: 0;
		betaAngle: 360.
	arc buildPathOnSpartaCanvas: Bloc preferableSpartaCanvas offscreen.
]

{ #category : #tests }
BlCircleSectorTest >> testDrawingWithSparta05 [
	"Test for corner radius"
	arc 
		externalRadius: 100;
		innerRadius: 50;
		alphaAngle: 0;
		betaAngle: 45;
		cornerRadius: 20.
	arc buildPathOnSpartaCanvas: Bloc preferableSpartaCanvas offscreen.
]

{ #category : #tests }
BlCircleSectorTest >> testSegmentSpacing [
	arc segmentSpacing: 1.
	self assert: arc segmentSpacing equals: 1.
]
