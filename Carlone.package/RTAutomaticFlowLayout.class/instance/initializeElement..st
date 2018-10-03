as yet unclassified
initializeElement: view
	view canvas when: TRResizeCanvasEvent do: [ :evt |
		RTFlowLayout new maxWidth: evt newExtent x; on: (view elements rtValue: elements)
	].