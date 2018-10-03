layout-utils
translateElementsHorizontally: row in: container

	| currentPoint |
	currentPoint := container origin.
	row do: [ :each |
		each computeLayout.
		each relocate: currentPoint.
		currentPoint := currentPoint translateBy: ((each width) @ 0 ).
	].