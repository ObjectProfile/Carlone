accessing
verticalGap
	"Return the vertical space, in pixel, between a layer and a children layer"

	^ verticalGap ifNil: [ self class verticalGap ]