I am an handy class to build legend in a visualization

-=-=-=-=-=-=-=-=
b := RTMondrian new.
b shape rectangle
	width: [ :c | c numberOfVariables * 5 ];
	height: #numberOfMethods.
b nodes: RTShape withAllSubclasses.
b edges connectFrom: #superclass.
b layout tree.
b build.

lb := RTLegendBuilder new.
lb view: b view.
lb addRectanglePolymetricWidth: 'number of methods' height: 'Line of code'.
lb build.

b
-=-=-=-=-=-=-=-=
