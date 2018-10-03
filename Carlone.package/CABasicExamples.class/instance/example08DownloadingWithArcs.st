shapes  - examples
example08DownloadingWithArcs
	<script: 'self new example08DownloadingWithArcs'>
	<noTest>
	| root aAngle shape element update client image win |
	root := BlElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].
	aAngle := CAScale linear
		domain: #(0 25 100);
		range: #(90 0 -270).
	shape := CAGeometryShape arc
		innerRadius: 80;
		externalRadius: 90;
		alphaAngle: 0;
		betaAngle: 360;
		background: Color lightGray;
		relocate: [ 100 asPoint - 90 ].
	root addChild: shape element.
	shape := CAGeometryShape arc 
		innerRadius: 78;
		cornerRadius: 10;
		externalRadius: 92;
		alphaAngle: 0;
		betaAngle: 90;
		background: Color gray;
		relocate: [ 100 asPoint - 92 ].
	root addChild: (element := shape element).
	update := [ :t | 
		element geometry
			alphaAngle: (aAngle scale: t);
			releaseCache.
		root invalidate. ].
	win := (Smalltalk tools inspector openOn: root)
		position: 0@0;
		extent: 300 asPoint;
		yourself.
[ :bar |
	bar title: 'Downloading...'.
	[ 
	update value: 0.
	(client := ZnEasy client)
		url: 'https://www.rutaverdebolivia.com/wp-content/uploads/edge-of-the-milky-way-Daniel-Kordan-e1484657466299.jpg';
		accept:  ZnMimeType imageJpeg;
		enforceHttpSuccess: true;
		enforceAcceptContentType: true;
		signalProgress: true;
		get.
	
	update value: 100.
	image := ImageReadWriter formFromStream: client entity readStream.
	root background: (BlBackground builder
		image: image;
		build).
	win extent: image extent + (0@100) ] on: HTTPProgress 
	do: [ :progress |
		progress isEmpty ifFalse: [ 
			bar current: progress percentage.
			update value: progress percentage ].
		progress resume.
		 ] 
] asJob run