lappend auto_path [pwd]/server

source [pwd]/server/math_statistics.tcl
source [pwd]/server/pdf_stat.tcl
source [pwd]/server/plotstat.tcl

package require bscalc
package require http


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

proc ::wibble::chart { state } {
    set symbol [dict? $state request post symbol {}]

    set url  http://dev.markitondemand.com/Api/v2/InteractiveChart/json?
    set query [subst -nocommands {parameters={"Normalized":false,"NumberOfDays":365,"DataPeriod":"Day","Elements":[{"Symbol":"$symbol","Type":"price","Params":["c"]}]}}]

    set res [::http::data [::http::geturl $url$query -strict 0]]

    dict set state response content [string range $res 1 end-1]
    dict set state response status 200

    sendresponse [dict? $state response]
}

proc ::wibble::feedme { state } {
    set data {{hello "three" blind ["mice"]}}

    dict set state response status 200
    dict set state response content $data
    sendresponse [dict? $state response]
}

::wibble::handle    /optimumprices  optimumprices root $root
::wibble::handle    /chart          chart         root $root
::wibble::handle    /feedme         feedme        root $root
