public
onElement: anElement
	
	| initialPosition |
	"We do this to make sure that elements contined in the arguments are not clipped out"
	anElement clipChildren: false.
	initialPosition := 0.
	anElement 
		addEventHandler: (BlEventHandler
			on: BlDragStartEvent
			do: [ :evt | 
				evt consumed: true.
				initialPosition := evt position - anElement position  ]);
		addEventHandler: (BlEventHandler
			on: BlDragEvent
			do: [ :evt | 
				evt consumed: true.
				anElement relocate: evt position - initialPosition  ])



