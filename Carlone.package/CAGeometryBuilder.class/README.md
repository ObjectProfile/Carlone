I am a class to create BlElements from bloc, with one geometry class.

Use my class methods to create one of my instances 

.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=

| shape blocElements|
shape := CAGeometryBuilder box 
	size: #linesOfCode;
	color: Color red.
	
blocElements := shape elementsOn: Collection withAllSubclasses
.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=