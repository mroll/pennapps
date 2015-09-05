package require math::statistics

set cmds [list log pow sqrt exp]
foreach cmd $cmds { interp alias {} $cmd {} ::tcl::mathfunc::$cmd }

interp alias {} cdf-norm {} math::statistics::cdf-normal 0 1


namespace eval bscalc {
    proc square { x } { pow $x 2 }

    proc calc_d1 { S K t v r } {
        expr { ([log [expr { $S / $K }]] + (($r + 0.5 * [square $v]) * $t )) / \
            ($v * [sqrt $t]) }
    }

    proc calc_d2 { d1 time vol } { expr { $d1 - $vol * [sqrt $time] } }

    proc call { S K t v r d1 d2 } {
        expr { $S * [cdf-norm $d1] - \
            [expr { $K * [exp [expr { -$r * $t }]] }] * [cdf-norm $d2] }
    }

    proc put {S K t v r d1 d2} {
        expr { [cdf-norm -$d2] * $K * [exp [expr { -$r * $t }]] - \
            [expr { [cdf-norm -$d1] * $S }] }
    }

    proc solve_black_scholes { fn S K t v r } {
        set d1 [calc_d1 $S $K $t $v $r]
        set d2 [calc_d2 $d1 $t $v]

        $fn $S $K $t $v $r $d1 $d2  
    }

    # takes args in the same format as [solve_black_scholes]
    proc optimum-prices { args } {
        set res {}
        lappend res [solve_black_scholes call {*}$args]
        lappend res [solve_black_scholes put  {*}$args]
    }

    namespace ensemble create -subcommands { solve_black_scholes optimum-prices }
}

package provide bscalc 1.0
