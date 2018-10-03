I am the basic pie builder, check my examples.

About me 
* My shape is an "arc"... not really my shape is an instance of "BlGeometryBuilder arc"
* the default background color of each arc is random 
* I use a layout to set the arcs position 
* I also have a label to create labels around my arcs

.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=
| b classes |
classes := { Array. String. Dictionary. Set }.
b := CAPieBuilder new.
b objects: classes.
b slice: #numberOfMethods.
b build.
^ b
.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=