interpolation
interpolate: aProgress
	^ 1 + (a * ((2 raisedTo: -10 * aProgress) * ((aProgress - s) * Float pi * 2 / p) sin) )
	"^ (2 raisedTo: (10 * (aProgress - 1))) * ((20 * Float pi * 1.5 / 3 * aProgress) cos)"