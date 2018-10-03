initialization
initialize
	super initialize.
	linear := self class linear.
	exponent := 1.
	domain := #(0 1).
	powp := CAScalePowPow exponent: exponent.
	powb := CAScalePowPow exponent: 1 / exponent.