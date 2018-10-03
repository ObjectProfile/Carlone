"
Basic popup like roassal popup
"
Class {
	#name : #CAPopup,
	#superclass : #CAInteraction,
	#instVars : [
		'label',
		'box'
	],
	#category : #'Carlone-Interaction'
}

{ #category : #accessing }
CAPopup class >> text: text [
	| inst |
	inst := self new.
	inst label text: text.
	^ inst
]

{ #category : #accessing }
CAPopup >> box [
	^ box
]

{ #category : #initialization }
CAPopup >> initialize [
	super initialize.
	label := CALabelShape label.
	
	box := CAGeometryBuilder box
		"cornerRadius: 2;"
		matchExtent: 100 asPoint;
		background: (Color colorFrom: '#efefef');
		effect: [(BlDropShadowEffect 
			color: (Color black alpha: 0.5) 
			width: 15
			offset: 0@7)];
		border: (BlBorder builder 
			paint: Color gray;
			width: 1;
			build).

]

{ #category : #accessing }
CAPopup >> label [
	^ label
]

{ #category : #public }
CAPopup >> onElement: anElement [
	| remove |
	remove := [ :evt |
		anElement topMostParent userData at: #popup ifPresent: [ :popupEl | 
		popupEl removeFromParent ] ].
	anElement 
		when: "BlMouseEnterEvent" BlMouseMoveEvent do: [ :evt | | popupElement textElement |
			remove value: evt.
			textElement := label elementOn: anElement caModel.
			textElement computeLayout.
			textElement relocate: 5 asPoint.
			box matchExtent: textElement measuredBounds extent+(10@7).
			popupElement := box elementOn: anElement caModel.
			popupElement addChild: textElement.
			
			anElement topMostParent addChild: popupElement.
			popupElement relocate: evt position + (10 @ 10).
			anElement topMostParent userData at: #popup put: popupElement. ];
		when: BlMouseOutEvent do: remove.
]
