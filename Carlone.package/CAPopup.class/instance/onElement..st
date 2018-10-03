public
onElement: anElement
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