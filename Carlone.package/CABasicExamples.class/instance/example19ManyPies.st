pie - examples
example19ManyPies
	
	<script: 'self new example19ManyPies inspect'>
	| root color titleShape data |
	data := self esportPrizepool.
	root := BlElement new
		background: Color white;
		size: 900 asPoint;
		layout: (BlGridLayout new
			columnCount: 2;
			cellSpacing: 10).
			
	color := CAScale google20.
	titleShape := CALabelShape label
		attributes:
			{(BrFontSizeAttribute size: 20).
			(BrTextForegroundAttribute paint: Color black).
			BrFontWeightAttribute bold}.
	data keysDo: [ :k | 
		| b title |
		b := CAPieBuilder new
			objects: (data at: k);
			slice: #value.
		b shape
			externalRadius: 200;
			innerRadius: 100;
			background: [ :obj | color scale: obj key ];
			segmentSpacing: 0.5.
		b label 
			text: #key;
			rotated.
		b build.
		b root size: 400 asPoint.
		title := titleShape elementOn: k.
		title computeLayout.
		title relocate: 200 - title measuredBounds center.
		b elements@(CAPopup
			text: [ :obj |
				obj value asStringWithCommas , '$, ' ,
				(obj value * 100 / b totalSum) rounded asString, '%' ]).
		b root addChild: title.
		root addChild: b root ].
	
	^ root