helpers
steps: start and: step
	^ (0 to: domain size - 1) collect: [ :i | (start + (step * i)) asFloat ].