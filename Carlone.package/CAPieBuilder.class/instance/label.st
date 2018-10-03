public - labels
label
	^ label ifNil: [ 
		label := CAPieLabelShape label
			builder: self;
			yourself ]