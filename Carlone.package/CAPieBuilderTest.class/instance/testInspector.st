tests
testInspector
	builder objects: (Array with: Dictionary with: Collection with: Set with: OrderedCollection ).
	builder slice: #numberOfMethods.
	builder build.
	builder gtInspectorIn: GLMCompositePresentation new.