tests
testDrawingWithSparta05
	"Test for corner radius"
	arc 
		externalRadius: 100;
		innerRadius: 50;
		alphaAngle: 0;
		betaAngle: 45;
		cornerRadius: 20.
	arc buildPathOnSpartaCanvas: Bloc preferableSpartaCanvas offscreen.