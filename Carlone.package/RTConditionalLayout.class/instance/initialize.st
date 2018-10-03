as yet unclassified
initialize
	super initialize.
	condition := true.
	thenLayout := RTTreeLayout new.
	elseLayout := RTGridLayout new.
	overallLayout := RTHorizontalLineLayout new.