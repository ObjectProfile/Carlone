*Carlone
generateUnitNgonPoints: sides rotation: rotationAngle angle: angleBloc radius: radiusBloc
	"sides a Number
	rotation is a number in radians
	angle is a function of 2 args(current angle and index of angle) this return an angle
	radius is a function of 2 args (current angle and index of angle) this retunr a number "
	| increment startAngle points currentAngle currentRadius |
	increment := 1.0 / sides * 2 * Float pi.
	startAngle := sides even
		ifTrue: [ (Float pi / 2) + (increment / 2) ]
		ifFalse: [ Float pi / 2 ].
	startAngle := startAngle + rotationAngle.
	points := Array new: sides.
	0 to: sides - 1 do: [ :i | 
		currentAngle := i * increment + startAngle.
		currentAngle := angleBloc value: currentAngle value: i.
		currentRadius := radiusBloc value: currentAngle value: i.
		points at: i+1 put: (currentAngle cos @ currentAngle sin) * currentRadius ].
	^ points