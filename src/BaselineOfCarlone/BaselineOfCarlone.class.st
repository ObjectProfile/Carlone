"
I am the baseline of carlone, Iceberg uses this class to load Bloc, and Carlone
"
Class {
	#name : #BaselineOfCarlone,
	#superclass : #BaselineOf,
	#category : #BaselineOfCarlone
}

{ #category : #baselines }
BaselineOfCarlone >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec baseline: 'Bloc' with: [ 
				spec repository: 'github://pharo-graphics/Bloc/src' ].
			spec
				package: #Carlone with: [ spec requires: #('Bloc') ].
			spec
				group: 'default' with: #('Carlone') ]
]
