reflective operations
doesNotUnderstand: aMessage
	"magic"
	commands add: (CACommand new 
		message: aMessage;
		isForModel: self isForModel;
		yourself).