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

    dict set state response content [::bscalc::optimum-prices $S $K $t $v $r]
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

proc ::wibble::quote { state } {
    set symbol [dict? $state request post symbol {}]

    set url http://dev.markitondemand.com/Api/v2/Quote/json
    set res [::http::data [::http::geturl $url -query symbol=$symbol]]

    dict set state response content $res
    dict set state response status 200

    sendresponse [dict? $state response]
}

::wibble::handle    /optimumprices  optimumprices root $root
::wibble::handle    /chart          chart         root $root
::wibble::handle    /quote          quote        root $root
