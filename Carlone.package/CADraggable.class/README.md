Interaction to make an element drag and droppable.

Here is an example:

root := CAGeometryShape box
	matchExtent: 2000 asPoint;
	element.
	
box := CAGeometryShape box
	matchExtent: 20 asPoint;
	background: Color red;
	element.
	
root addChild: box.
box @ CADraggable.

root.