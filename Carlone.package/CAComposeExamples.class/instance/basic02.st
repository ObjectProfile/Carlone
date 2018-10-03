test basic
basic02
	<script: 'self new basic02 inspect'>
	| ca boxes |
	ca := CACompose new.
	boxes := CAGeometryShape box elementsOn: (1 to: 30).
	boxes @ CAPopup.
	ca addAll: boxes.
	ca grid.
	^ ca