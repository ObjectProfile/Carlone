pie - examples
example14Rainbow
	<script: 'self new example14Rainbow inspect'>
	| b |
	b := CAPieBuilder new.
	b objects: (0 to: 360).
	b shape
		innerRadius: 150;
		externalRadius: 200;
		alphaAngle: #yourself;
		betaAngle: [ :d | d +2 ]."to avoid arc spacing"
	b build.
	b root addAnimation: (BlNumberTransition new
		from: 0; to: 500; duration: 2 seconds;
		easing: (BlEasingElastic2 new);
		beInfinite;
		onStepDo: [ :t | b elements do: [:e |
			e background: (Color h: e caModel + t s: 1 l: 0.5)] ]).
	^ b