# Black-Scholes Formula:
#
# C(S, t) = N(d1)S - N(d2)K * e^-r(T-t)
# P(S, t) = N(-d2)K * e^-r(T-t) - N(-d1)S
#
# where,
#
# d1 = [ ln(S/K) + (r + v^2 / 2) * (T-t) ] / (v * sqrt(T-t))
# d2 = d1 - v * sqrt(T-t)
#
# C(S, t) is the price of a European call option,
# P(S, t) is the price of a European put option,
# S is the price of the stock,
# K is the strike price of the option,
# N(x) is the standard normal cumulative distribution function,
# (T-t) is time to maturity,
# r is the annualized risk-free interest rate, continuously compounded.

package require math::statistics

set cmds [list log pow sqrt exp]
foreach cmd $cmds { interp alias {} $cmd {} ::tcl::mathfunc::$cmd }

interp alias {} cdf-norm {} math::statistics::cdf-normal 0 1

proc square { x } { pow $x 2 }

proc calc_d1 { S K t v r } {
    expr { ([log [expr { $S / $K }]] + (($r + 0.5 * [square $v]) * $t )) / \
        ($v * [sqrt $t]) }
}

proc calc_d2 { d1 time vol } { expr { $d1 - $vol * [sqrt $time] } }

proc solve_black_scholes { fn S K t v r } {
    set d1 [calc_d1 $S $K $t $v $r]
    set d2 [calc_d2 $d1 $t $v]

    $fn $S $K $t $v $r $d1 $d2  
}

proc call { S K t v r d1 d2 } {
    expr { $S * [cdf-norm $d1] - \
        [expr { $K * [exp [expr { -$r * $t }]] }] * [cdf-norm $d2] }
}

proc put {S K t v r d1 d2} {
    expr { [cdf-norm -$d2] * $K * [exp [expr { -$r * $t }]] - \
        [expr { [cdf-norm -$d1] * $S }] }
}

set stock   62.0
set strike  60.0
set time    [expr { 40.0 / 365.0 }]
set vol     0.32
set rf_rate 0.04

set args [list $stock $strike $time $vol $rf_rate]

puts [solve_black_scholes call {*}$args]
puts [solve_black_scholes put {*}$args]

# outputs,
#
# 3.858783435524174
# 1.5963453638686538
