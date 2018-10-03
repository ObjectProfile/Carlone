public - convenient
addColorFadingUsing: colors text: textualDescription
	"Specify a description of a fading using a provided set of colors"
	items
		add:
			(CAColorFadingLegendItem new
				colors: colors;
				description: textualDescription)