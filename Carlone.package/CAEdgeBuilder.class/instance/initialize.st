initialization
initialize
	super initialize.
	self noRepetition.
	shouldMoveBehind := false.
	shouldNotBeUsedInLayout := true.
	
	"The view has to be explicitely set by the end-user"
	viewHasBeenManuallySet := false.
	
	actions := OrderedCollection new