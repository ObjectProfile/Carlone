"
A CAScaleTest is a test class for testing the behavior of CAScale
"
Class {
	#name : #CAScaleTest,
	#superclass : #CATest,
	#category : #'Carlone-Tests'
}

{ #category : #'tests - colors' }
CAScaleTest >> testCategories [
	| color |
	color := CAScale category10.
	self assert: color range size equals: 10.
	
	1 to: 10 do: [ :i | 
		self assert: (color scale: i) class equals: Color ].
	
	1 to: 10 do: [ :i | 
		self assert: (color scale: i) equals: (color scale: i + 10) ].
	
	color := CAScale category20.
	
	self assert: color range size equals: 20.
	0 to: 19 do: [ :i | 
		self assert: (color scale: i) class equals: Color ].
	color := CAScale category20b.
	
	self assert: color range size equals: 20.
	color := CAScale category20c.
	self assert: color range size equals: 20.
	
	color := CAScale paired12.
	self assert: color range size equals: 12.
]

{ #category : #'tests - scales' }
CAScaleTest >> testLogScale [
	| log |
	log := CAScale log.
	self 
		assert: log base equals: 10;
		assert: log range equals: #(0 1);
		assert: (log scale: 10) equals: 1;
		assert: (log scale: 100) equals: 2;
		assert: (log scale: 50) equals: 1.6989700043360185.
	log := CAScale log
		base: Float e;
		domain: (#(0 9) collect: #exp);
		range: #(200 0).
	self assert: ((log scale: 50) closeTo: 113.06615543493011).
	self assert: ((log scale: 0.01) closeTo: 302.3371152441798).
	self assert: ((log scale: 100) closeTo: 97.66288475582019).
	self assert: ((log invert: 10) closeTo: 5166.754427175983).
	
	self assert: (log scale: 9000) closeTo: -2.3328856959635047.
	log clamp: true.
	self
		assert: (log scale: 9000) closeTo: 0;
		assert: log interpolate equals: CAInterpolator.
	log interpolate: CAInterpolator
	

]

{ #category : #'tests - scales' }
CAScaleTest >> testOrdinalScale [
	| ordinal |
	ordinal := CAScale ordinal
		domain: #('a' 'b' 'c' 'd' 'e' 'f');
		range: #(10 20 30 40 50 60).
	self 
		assert: (ordinal scale: 'a') equals: 10;
		assert: (ordinal scale: 'd') equals: 40;
		assert: (ordinal scale: 'f') equals: 60.
		
]

{ #category : #'tests - scales' }
CAScaleTest >> testOrdinalScaleRangeBands [
	| ordinal |
	ordinal := CAScale ordinal
		domain: #('a' 'b' 'c' 'd' 'e' 'f');
		rangeBands: #(0 960).
	self 
		assert: ordinal rangeBand equals: 160;
		assert: (ordinal scale: 'a') equals: 0;
		assert: (ordinal scale: 'd') equals: 480;
		assert: (ordinal scale: 'f') equals: 800;
		
		assert: ordinal rangeExtent equals: #(0 960)
		
]

{ #category : #'tests - scales' }
CAScaleTest >> testOrdinalScaleRangePoints [
	| ordinal |
	ordinal := CAScale ordinal
		domain: #('apple' 'orange' 'banana' 'grape');
		rangePoints: #(0 960).
	self 
		assert: (ordinal scale: 'apple') equals: 0;
		assert: (ordinal scale: 'orange') equals: 320;
		assert: (ordinal scale: 'grape') equals: 960;
		
		assert: ordinal rangeExtent equals: #(0 960)
	
		
]

{ #category : #'tests - scales' }
CAScaleTest >> testOrdinalScaleRangeRoundBands [
	| ordinal |
	ordinal := CAScale ordinal
		domain: #('a' 'b' 'c' 'd' 'e' 'f');
		rangeRoundBands: #(0 960) padding: 0.1.
	self 
		assert: ordinal rangeBand equals: 141;
		assert: (ordinal scale: 'a') equals: 17;
		assert: (ordinal scale: 'd') equals: 488;
		assert: (ordinal scale: 'f') equals: 802;
		assert: ordinal rangeExtent equals: #(0 960).
		
	ordinal := CAScale ordinal
		domain: #('a' 'b' 'c' 'd' 'e' 'f');
		rangeRoundBands: #(0 960).
	self 
		assert: ordinal rangeBand equals: 160;
		assert: (ordinal scale: 'a') equals: 0;
		assert: (ordinal scale: 'd') equals: 480;
		assert: (ordinal scale: 'f') equals: 800;
		assert: ordinal rangeExtent equals: #(0 960)
]

{ #category : #'tests - scales' }
CAScaleTest >> testOrdinalScaleRangeRoundPoints [
	| ordinal |
	ordinal := CAScale ordinal
		domain: #(1 2 3 4);
		rangeRoundPoints: #(0 100).
	self 
		assert: ordinal rangeBand equals: 0;
		assert: (ordinal scale: 1) equals: 0;
		assert: (ordinal scale: 2) equals: 33.333333333333333;
		assert: (ordinal scale: 4) equals: 100.
	
]

{ #category : #'tests - scales' }
CAScaleTest >> testPowScale [
	| pow |
	pow := CAScale pow.
	
	self
		assert: pow exponent equals: 1;
		assert: (pow scale: 5) equals: 5.
	pow exponent: 2.
	self
		assert: (pow scale: 5) equals: 25;
		assert: (pow invert: 25) equals: 5;
		assert: pow exponent equals: 2.
	
	pow 
		domain: #(0 100);
		range: #(-10 10);
		clamp: true.
		
	self 
		assert: (pow scale: 200) equals: 10;
		assert: (pow scale: 99.9) closeTo: 9.960020000000004.
	pow interpolate: CARoundInterpolator.
	self 
		assert: pow interpolate equals: CARoundInterpolator;
		assert: (pow scale: 99.9) equals: 10;
		assert: pow range equals: #(-10 10)
]

{ #category : #'tests - linear' }
CAScaleTest >> testRandom [
	"Random uses CAScale linear"
	| random value |
	random := SharedRandom globalGenerator.
	value := random caNext: 10.
	self assert: (value between: 0 and: 10).
	value := random caNext: -10 and: -5.
	self assert: (value between: -10 and: -5 ).
]

{ #category : #'tests - linear' }
CAScaleTest >> testScaleLinear [
	| linear |
	linear := CAScale linear.
	self 
		assert: linear domain equals: #(0 1);
		assert: linear range equals: #(0 1).
	linear range: #(1 10).
	self
		assert: (linear scale: 1) equals: 10;
		assert: (linear scale: 0.5) equals: 5.5.
		
	self assert: linear interpolate equals: CAInterpolator.
	self assert: linear uninterpolate equals: CAUninterpolateNumber.
	
	
]

{ #category : #'tests - linear' }
CAScaleTest >> testScaleLinearClamp [
	| linear |
	linear := CAScale linear
		domain: #(0 10);
		range: #(0 100).
	self assert: (linear scale: 11) equals: 110.
	self assert: (linear scale: -5) equals: -50.
	linear clamp: true.
	self assert: (linear scale: 11) equals: 100.
	self assert: (linear scale: -5) equals: 0.
]

{ #category : #'tests - linear' }
CAScaleTest >> testScaleLinearColors [
	| linear |
	linear := CAScale linear
		domain: #(0 100);
		range: #('white' 'black').
	self assert: (linear scale: 50) equals: Color gray.
	self assert: (linear scale: 0) equals: Color white.
	self assert: (linear scale: 100) equals: Color black.	
]

{ #category : #'tests - linear' }
CAScaleTest >> testScaleLinearInvert [
	| linear |
	linear := CAScale linear
		domain: #(-5 5);
		range: #(40 50).
	self 
		assert: (linear scale: 0) equals: 45;
		assert: (linear scale: 5) equals: 50;
		assert: (linear invert: 50) equals: 5;
		assert: (linear invert: 40) equals: -5
	
]

{ #category : #'tests - linear' }
CAScaleTest >> testScaleLinearRound [
	| linear |
	linear := CAScale linear
		domain: #(-5 5);
		rangeRound: #(40 50).
	self 
		assert: (linear scale: 0.2) equals: 45;
		assert: (linear scale: 5.1) equals: 50;
		assert: (linear invert: 50) equals: 5;
		assert: (linear invert: 40) equals: -5
	
]

{ #category : #'tests - linear' }
CAScaleTest >> testScalePolyLinear [
	| linear |
	linear := CAScale linear
		domain: #(0 0.5 1);
		range: #(10 80 10).
	self 
		assert: (linear scale: 0) equals: 10;
		assert: (linear scale: 0.5) equals: 80;
		assert: (linear scale: 1) equals: 10;
		assert: (linear scale: 1.5) equals: -60.
	linear := CAScale linear
		domain: #(0 0.5 1);
		range: #('white' 'black' 'white').
	self 
		assert: (linear scale: 0) equals: Color white;
		assert: (linear scale: 0.25) equals: Color gray;
		assert: (linear scale: 0.75) equals: Color gray.
	
	
	
]

{ #category : #'tests - scales' }
CAScaleTest >> testSqrt [
	| sqrt |
	sqrt := CAScale sqrt.
	self 
		assert: sqrt exponent equals: 0.5;
		assert: ((sqrt scale: 9) closeTo: 3).
	
	sqrt := CAScale sqrt
		domain: #(0 36756666);
		range: #(0 220).
	self assert: (sqrt scale: 4661900) closeTo: 78.34947695663722
	
]
