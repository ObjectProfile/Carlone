layout-utils
translateElementsVertically: row in: container
	| currentPoint |
	currentPoint := container origin.
	row do: [ :each | 
		each computeLayout.
		each relocate: currentPoint.
		currentPoint := currentPoint translateBy: (0@(each height))]