accessing
horizontalGap
	"Return the horizontal space, in pixel, between two neighbors"

	^ horizontalGap ifNil: [ self class horizontalGap ]