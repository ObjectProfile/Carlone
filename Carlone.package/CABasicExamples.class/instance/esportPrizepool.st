pie - examples
esportPrizepool
	"source https://www.esportsearnings.com/games"
	| arr data |
	arr := {
		{'Dota' . 2013 . 2874380}.
		{'Dota' . 2014 . 10931105}.
		{'Dota' . 2015 . 18429613}.
		{'Dota' . 2016 . 20770460}.
		{'Dota' . 2017 . 24787916}.
		{'SC2' . 2013 . 250000}.
		{'SC2' . 2014 . 250000}.
		{'SC2' . 2015 . 250000}.
		{'SC2' . 2016 . 500000}.
		{'SC2' . 2017 . 700000}.
		{'LOL' . 2013 . 246575}.
		{'LOL' . 2014 . 2130000}.
		{'LOL' . 2015 . 2130000}.
		{'LOL' . 2016 . 5070000}.
		{'LOL' . 2017 . 4946969}}.
	data := Dictionary new.
	arr do: [ :d | 
		| list |
		list := data at: d first ifAbsentPut: [ OrderedCollection new ].
		list add: d second -> d third ].
	^ data
	