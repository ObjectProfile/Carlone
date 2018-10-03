"
I can create a the beatiful windows os effect, to crash or not the elements and their animations
"
Class {
	#name : #CAWindowsCrashElement,
	#superclass : #BlElement,
	#instVars : [
		'session',
		'cachedSurface',
		'crash'
	],
	#category : #'Carlone-Bloc'
}

{ #category : #accessing }
CAWindowsCrashElement >> crash [
	^ crash ifNil: [ false ].
]

{ #category : #accessing }
CAWindowsCrashElement >> crash: bool [
	crash := bool
]

{ #category : #'as yet unclassified' }
CAWindowsCrashElement >> drawChildrenOnSpartaCanvas: aCanvas [
	(session ~~ Smalltalk session or: [ cachedSurface isNil ]) ifTrue: [
		| aCachedCanvas |
		session := Smalltalk session.
		aCachedCanvas := aCanvas similar: self boundsInWindow extent ceiling asIntegerPoint.
		cachedSurface := aCachedCanvas surface.
		aCachedCanvas release ].

	aCanvas transform during: [ :aTransform |
			aTransform scaleBy: 1.0 / self space windowScale.
			aTransform apply.
			aCanvas fill
				paint: cachedSurface;
				path: cachedSurface bounds;
				draw.
			super drawChildrenOnSpartaCanvas: aCanvas.
			self releaseCaches.
			cachedSurface := aCanvas surface ]
]

{ #category : #'as yet unclassified' }
CAWindowsCrashElement >> invalidRect: aBlBounds from: anElement [
	super invalidRect: aBlBounds from: anElement.
	self crash ifFalse: [ self releaseCaches ].
	
]

{ #category : #'as yet unclassified' }
CAWindowsCrashElement >> onRemovedFromSceneGraph [
	super onRemovedFromSceneGraph.

	self releaseCaches
]

{ #category : #'as yet unclassified' }
CAWindowsCrashElement >> releaseCaches [
	cachedSurface ifNotNil: #release.
	cachedSurface := nil
]
