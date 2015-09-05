lappend auto_path [pwd]/server

source [pwd]/server/math_statistics.tcl
source [pwd]/server/pdf_stat.tcl
source [pwd]/server/plotstat.tcl

package require bscalc


proc ::wibble::optimumprices { state } {
    set S [dict? $state request post S {}]
    set K [dict? $state request post K {}]
    set t [dict? $state request post t {}]
    set v [dict? $state request post v {}]
    set r [dict? $state request post r {}]

    set res  [::bscalc::optimum-prices $S $K $t $v $r]

    dict set state response content call [lindex $res 0]
    dict set state response content put  [lindex $res 1]

    dict set state response status 200
    sendresponse [dict? $state response]
}

::wibble::handle    /optimumprices optimumprices root $root
