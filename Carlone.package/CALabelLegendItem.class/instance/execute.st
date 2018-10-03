hooks
execute

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
	