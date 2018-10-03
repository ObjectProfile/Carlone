reflective operations
if: booleanBlock actions: actionsBlock
	commands add: (CAConditionCommand new 
		message: actionsBlock;
		builder: self;
		condition: booleanBlock;
		isForModel: self isForModel;
		yourself).