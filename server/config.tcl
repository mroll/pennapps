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
    set good {"Labels":null,"Positions":[0,0.004,0.008,0.012,0.016,0.019,0.023,0.027,0.031,0.035,0.039,0.043,0.047,0.051,0.054,0.058,0.062,0.066,0.07,0.074,0.078,0.082,0.086,0.089,0.093,0.097,0.101,0.105,0.109,0.113,0.117,0.121,0.125,0.128,0.132,0.136,0.14,0.144,0.148,0.152,0.156,0.16,0.163,0.167,0.171,0.175,0.179,0.183,0.187,0.191,0.195,0.198,0.202,0.206,0.21,0.214,0.218,0.222,0.226,0.233,0.237,0.241,0.245,0.249,0.253,0.257,0.261,0.265,0.268,0.272,0.276,0.28,0.284,0.288,0.292,0.296,0.3,0.304,0.311,0.315,0.319,0.323,0.331,0.335,0.339,0.342,0.346,0.35,0.354,0.358,0.362,0.366,0.37,0.377,0.381,0.385,0.389,0.393,0.397,0.401,0.405,0.409,0.412,0.416,0.42,0.424,0.428,0.432,0.436,0.44,0.444,0.447,0.455,0.459,0.463,0.467,0.471,0.475,0.479,0.482,0.486,0.49,0.494,0.498,0.502,0.506,0.51,0.514,0.518,0.521,0.525,0.529,0.533,0.537,0.541,0.545,0.549,0.553,0.556,0.56,0.564,0.568,0.572,0.576,0.58,0.584,0.588,0.591,0.595,0.599,0.603,0.607,0.611,0.615,0.619,0.623,0.626,0.63,0.634,0.638,0.642,0.646,0.65,0.654,0.658,0.661,0.665,0.669,0.673,0.677,0.681,0.685,0.689,0.693,0.696,0.7,0.704,0.708,0.712,0.716,0.72,0.724,0.728,0.732,0.735,0.739,0.743,0.747,0.751,0.755,0.759,0.763,0.767,0.77,0.774,0.778,0.782,0.786,0.79,0.794,0.798,0.802,0.805,0.809,0.813,0.817,0.821,0.825,0.829,0.833,0.837,0.84,0.844,0.848,0.852,0.856,0.86,0.864,0.868,0.872,0.875,0.879,0.883,0.887,0.891,0.895,0.899,0.903,0.907,0.911,0.914,0.918,0.922,0.926,0.93,0.934,0.938,0.942,0.946,0.949,0.953,0.957,0.961,0.965,0.969,0.973,0.977,0.981,0.984,0.988,0.992,0.996,1], "Dates":["2014-09-05T00:00:00","2014-09-08T00:00:00","2014-09-09T00:00:00","2014-09-10T00:00:00","2014-09-11T00:00:00","2014-09-12T00:00:00","2014-09-15T00:00:00","2014-09-16T00:00:00","2014-09-17T00:00:00","2014-09-18T00:00:00","2014-09-19T00:00:00","2014-09-22T00:00:00","2014-09-23T00:00:00","2014-09-24T00:00:00","2014-09-25T00:00:00","2014-09-26T00:00:00","2014-09-29T00:00:00","2014-09-30T00:00:00","2014-10-01T00:00:00","2014-10-02T00:00:00","2014-10-03T00:00:00","2014-10-06T00:00:00","2014-10-07T00:00:00","2014-10-08T00:00:00","2014-10-09T00:00:00","2014-10-10T00:00:00","2014-10-13T00:00:00","2014-10-14T00:00:00","2014-10-15T00:00:00","2014-10-16T00:00:00","2014-10-17T00:00:00","2014-10-20T00:00:00","2014-10-21T00:00:00","2014-10-22T00:00:00","2014-10-23T00:00:00","2014-10-24T00:00:00","2014-10-27T00:00:00","2014-10-28T00:00:00","2014-10-29T00:00:00","2014-10-30T00:00:00","2014-10-31T00:00:00","2014-11-03T00:00:00","2014-11-04T00:00:00","2014-11-05T00:00:00","2014-11-06T00:00:00","2014-11-07T00:00:00","2014-11-10T00:00:00","2014-11-11T00:00:00","2014-11-12T00:00:00","2014-11-13T00:00:00","2014-11-14T00:00:00","2014-11-17T00:00:00","2014-11-18T00:00:00","2014-11-19T00:00:00","2014-11-20T00:00:00","2014-11-21T00:00:00","2014-11-24T00:00:00","2014-11-25T00:00:00","2014-11-26T00:00:00","2014-11-28T00:00:00","2014-12-01T00:00:00","2014-12-02T00:00:00","2014-12-03T00:00:00","2014-12-04T00:00:00","2014-12-05T00:00:00","2014-12-08T00:00:00","2014-12-09T00:00:00","2014-12-10T00:00:00","2014-12-11T00:00:00","2014-12-12T00:00:00","2014-12-15T00:00:00","2014-12-16T00:00:00","2014-12-17T00:00:00","2014-12-18T00:00:00","2014-12-19T00:00:00","2014-12-22T00:00:00","2014-12-23T00:00:00","2014-12-24T00:00:00","2014-12-26T00:00:00","2014-12-29T00:00:00","2014-12-30T00:00:00","2014-12-31T00:00:00","2015-01-02T00:00:00","2015-01-05T00:00:00","2015-01-06T00:00:00","2015-01-07T00:00:00","2015-01-08T00:00:00","2015-01-09T00:00:00","2015-01-12T00:00:00","2015-01-13T00:00:00","2015-01-14T00:00:00","2015-01-15T00:00:00","2015-01-16T00:00:00","2015-01-20T00:00:00","2015-01-21T00:00:00","2015-01-22T00:00:00","2015-01-23T00:00:00","2015-01-26T00:00:00","2015-01-27T00:00:00","2015-01-28T00:00:00","2015-01-29T00:00:00","2015-01-30T00:00:00","2015-02-02T00:00:00","2015-02-03T00:00:00","2015-02-04T00:00:00","2015-02-05T00:00:00","2015-02-06T00:00:00","2015-02-09T00:00:00","2015-02-10T00:00:00","2015-02-11T00:00:00","2015-02-12T00:00:00","2015-02-13T00:00:00","2015-02-17T00:00:00","2015-02-18T00:00:00","2015-02-19T00:00:00","2015-02-20T00:00:00","2015-02-23T00:00:00","2015-02-24T00:00:00","2015-02-25T00:00:00","2015-02-26T00:00:00","2015-02-27T00:00:00","2015-03-02T00:00:00","2015-03-03T00:00:00","2015-03-04T00:00:00","2015-03-05T00:00:00","2015-03-06T00:00:00","2015-03-09T00:00:00","2015-03-10T00:00:00","2015-03-11T00:00:00","2015-03-12T00:00:00","2015-03-13T00:00:00","2015-03-16T00:00:00","2015-03-17T00:00:00","2015-03-18T00:00:00","2015-03-19T00:00:00","2015-03-20T00:00:00","2015-03-23T00:00:00","2015-03-24T00:00:00","2015-03-25T00:00:00","2015-03-26T00:00:00","2015-03-27T00:00:00","2015-03-30T00:00:00","2015-03-31T00:00:00","2015-04-01T00:00:00","2015-04-02T00:00:00","2015-04-06T00:00:00","2015-04-07T00:00:00","2015-04-08T00:00:00","2015-04-09T00:00:00","2015-04-10T00:00:00","2015-04-13T00:00:00","2015-04-14T00:00:00","2015-04-15T00:00:00","2015-04-16T00:00:00","2015-04-17T00:00:00","2015-04-20T00:00:00","2015-04-21T00:00:00","2015-04-22T00:00:00","2015-04-23T00:00:00","2015-04-24T00:00:00","2015-04-27T00:00:00","2015-04-28T00:00:00","2015-04-29T00:00:00","2015-04-30T00:00:00","2015-05-01T00:00:00","2015-05-04T00:00:00","2015-05-05T00:00:00","2015-05-06T00:00:00","2015-05-07T00:00:00","2015-05-08T00:00:00","2015-05-11T00:00:00","2015-05-12T00:00:00","2015-05-13T00:00:00","2015-05-14T00:00:00","2015-05-15T00:00:00","2015-05-18T00:00:00","2015-05-19T00:00:00","2015-05-20T00:00:00","2015-05-21T00:00:00","2015-05-22T00:00:00","2015-05-26T00:00:00","2015-05-27T00:00:00","2015-05-28T00:00:00","2015-05-29T00:00:00","2015-06-01T00:00:00","2015-06-02T00:00:00","2015-06-03T00:00:00","2015-06-04T00:00:00","2015-06-05T00:00:00","2015-06-08T00:00:00","2015-06-09T00:00:00","2015-06-10T00:00:00","2015-06-11T00:00:00","2015-06-12T00:00:00","2015-06-15T00:00:00","2015-06-16T00:00:00","2015-06-17T00:00:00","2015-06-18T00:00:00","2015-06-19T00:00:00","2015-06-22T00:00:00","2015-06-23T00:00:00","2015-06-24T00:00:00","2015-06-25T00:00:00","2015-06-26T00:00:00","2015-06-29T00:00:00","2015-06-30T00:00:00","2015-07-01T00:00:00","2015-07-02T00:00:00","2015-07-06T00:00:00","2015-07-07T00:00:00","2015-07-08T00:00:00","2015-07-09T00:00:00","2015-07-10T00:00:00","2015-07-13T00:00:00","2015-07-14T00:00:00","2015-07-15T00:00:00","2015-07-16T00:00:00","2015-07-17T00:00:00","2015-07-20T00:00:00","2015-07-21T00:00:00","2015-07-22T00:00:00","2015-07-23T00:00:00","2015-07-24T00:00:00","2015-07-27T00:00:00","2015-07-28T00:00:00","2015-07-29T00:00:00","2015-07-30T00:00:00","2015-07-31T00:00:00","2015-08-03T00:00:00","2015-08-04T00:00:00","2015-08-05T00:00:00","2015-08-06T00:00:00","2015-08-07T00:00:00","2015-08-10T00:00:00","2015-08-11T00:00:00","2015-08-12T00:00:00","2015-08-13T00:00:00","2015-08-14T00:00:00","2015-08-17T00:00:00","2015-08-18T00:00:00","2015-08-19T00:00:00","2015-08-20T00:00:00","2015-08-21T00:00:00","2015-08-24T00:00:00","2015-08-25T00:00:00","2015-08-26T00:00:00","2015-08-27T00:00:00","2015-08-28T00:00:00","2015-08-31T00:00:00","2015-09-01T00:00:00","2015-09-02T00:00:00","2015-09-03T00:00:00","2015-09-04T00:00:00"], "Elements":[{"Currency":"USD","TimeStamp":null,"Symbol":"GOOGL","Type":"price","DataSeries":{"close":{"min":497.06,"max":699.62,"maxDate":"2015-07-17T00:00:00","minDate":"2015-01-12T00:00:00","values":[597.78,601.63,591.97,593.42,591.11,584.9,581.64,588.78,593.29,597.27,605.4,597.27,591.18,598.42,585.25,587.9,587.81,588.41,579.63,580.88,586.25,587.78,574.1,583.74,570.81,555.19,544.75,548.69,540.73,536.92,522.97,532.38,538.03,542.69,553.65,548.9,549.88,558.94,558.45,560.27,567.87,563.77,564.19,555.95,551.69,551.82,558.23,561.29,558.25,556.44,555.19,546.64,544.51,547.2,543.76,545.89,547.48,549.23,547.73,549.08,539.65,538.59,536.97,542.58,528.08,530.73,536.11,528.04,532.11,521.51,515.84,498.16,506.45,514.62,520.04,532.3,538.77,536.93,541.52,537.31,535.28,530.66,529.55,519.46,506.64,505.15,506.91,500.72,497.06,501.8,505.93,504.01,510.455,509.94,520.39,537.3,541.95,536.72,521.19,512.43,513.23,537.55,532.2,533.3,526.1,529.83,533.875,529.28,540.16,538,546.01,551.16,545.01,542.65,546.45,541.8,535,538.65,547.33,559.29,562.63,575.02,578.795,578.33,581.435,572.9,574.1,559.85,555.69,561.17,553,561.64,557.61,566.16,563.67,564.95,565.37,577.54,567,563.64,557.55,561.135,554.7,549.49,541.31,543.95,544.86,548.84,548.02,548.54,548.64,539.78,541.04,543.52,532.74,544.53,542.925,549.18,557.46,573.66,566.12,564.37,561.39,548.77,551.16,552.84,543.045,535.08,542.04,548.95,545.78,538.73,539.49,549.2,546.49,546.67,549.28,552.51,556.81,554.52,547.19,554.25,554.18,545.32,549.21,553.95,555.29,551.69,549.53,543.48,542.16,552.6,550.04,547.47,543,544.87,546.6,556.18,557.52,559.68,563.39,558.57,557.95,553.06,541.25,540.04,543.3,547.34,545.62,550.03,541.7,544.65,556.11,571.73,584.18,583.96,601.78,699.62,692.84,695.35,695.1,674.73,654.77,658.27,659.66,661.43,664.56,657.5,664.72,661.28,673.29,670.15,664.39,663.14,690.3,691.47,686.51,689.37,694.11,688.73,694.04,679.48,644.03,618.11,612.47,659.74,667.96,659.69,647.82,629.56,644.91,637.05,629.075]}}}]}

    set fd [open res.out w]
    puts $fd [string range $res 1 end-1]
    close $fd

    set fd [open good.out w]
    puts $fd $good
    close $fd

    dict set state response content [string range $res 1 end-1]
    # dict set state response content data {"Labels":null,"Positions":[0,0.004,0.008,0.012,0.016,0.019,0.023,0.027,0.031,0.035,0.039,0.043,0.047,0.051,0.054,0.058,0.062,0.066,0.07,0.074,0.078,0.082,0.086,0.089,0.093,0.097,0.101,0.105,0.109,0.113,0.117,0.121,0.125,0.128,0.132,0.136,0.14,0.144,0.148,0.152,0.156,0.16,0.163,0.167,0.171,0.175,0.179,0.183,0.187,0.191,0.195,0.198,0.202,0.206,0.21,0.214,0.218,0.222,0.226,0.233,0.237,0.241,0.245,0.249,0.253,0.257,0.261,0.265,0.268,0.272,0.276,0.28,0.284,0.288,0.292,0.296,0.3,0.304,0.311,0.315,0.319,0.323,0.331,0.335,0.339,0.342,0.346,0.35,0.354,0.358,0.362,0.366,0.37,0.377,0.381,0.385,0.389,0.393,0.397,0.401,0.405,0.409,0.412,0.416,0.42,0.424,0.428,0.432,0.436,0.44,0.444,0.447,0.455,0.459,0.463,0.467,0.471,0.475,0.479,0.482,0.486,0.49,0.494,0.498,0.502,0.506,0.51,0.514,0.518,0.521,0.525,0.529,0.533,0.537,0.541,0.545,0.549,0.553,0.556,0.56,0.564,0.568,0.572,0.576,0.58,0.584,0.588,0.591,0.595,0.599,0.603,0.607,0.611,0.615,0.619,0.623,0.626,0.63,0.634,0.638,0.642,0.646,0.65,0.654,0.658,0.661,0.665,0.669,0.673,0.677,0.681,0.685,0.689,0.693,0.696,0.7,0.704,0.708,0.712,0.716,0.72,0.724,0.728,0.732,0.735,0.739,0.743,0.747,0.751,0.755,0.759,0.763,0.767,0.77,0.774,0.778,0.782,0.786,0.79,0.794,0.798,0.802,0.805,0.809,0.813,0.817,0.821,0.825,0.829,0.833,0.837,0.84,0.844,0.848,0.852,0.856,0.86,0.864,0.868,0.872,0.875,0.879,0.883,0.887,0.891,0.895,0.899,0.903,0.907,0.911,0.914,0.918,0.922,0.926,0.93,0.934,0.938,0.942,0.946,0.949,0.953,0.957,0.961,0.965,0.969,0.973,0.977,0.981,0.984,0.988,0.992,0.996,1], "Dates":["2014-09-05T00:00:00","2014-09-08T00:00:00","2014-09-09T00:00:00","2014-09-10T00:00:00","2014-09-11T00:00:00","2014-09-12T00:00:00","2014-09-15T00:00:00","2014-09-16T00:00:00","2014-09-17T00:00:00","2014-09-18T00:00:00","2014-09-19T00:00:00","2014-09-22T00:00:00","2014-09-23T00:00:00","2014-09-24T00:00:00","2014-09-25T00:00:00","2014-09-26T00:00:00","2014-09-29T00:00:00","2014-09-30T00:00:00","2014-10-01T00:00:00","2014-10-02T00:00:00","2014-10-03T00:00:00","2014-10-06T00:00:00","2014-10-07T00:00:00","2014-10-08T00:00:00","2014-10-09T00:00:00","2014-10-10T00:00:00","2014-10-13T00:00:00","2014-10-14T00:00:00","2014-10-15T00:00:00","2014-10-16T00:00:00","2014-10-17T00:00:00","2014-10-20T00:00:00","2014-10-21T00:00:00","2014-10-22T00:00:00","2014-10-23T00:00:00","2014-10-24T00:00:00","2014-10-27T00:00:00","2014-10-28T00:00:00","2014-10-29T00:00:00","2014-10-30T00:00:00","2014-10-31T00:00:00","2014-11-03T00:00:00","2014-11-04T00:00:00","2014-11-05T00:00:00","2014-11-06T00:00:00","2014-11-07T00:00:00","2014-11-10T00:00:00","2014-11-11T00:00:00","2014-11-12T00:00:00","2014-11-13T00:00:00","2014-11-14T00:00:00","2014-11-17T00:00:00","2014-11-18T00:00:00","2014-11-19T00:00:00","2014-11-20T00:00:00","2014-11-21T00:00:00","2014-11-24T00:00:00","2014-11-25T00:00:00","2014-11-26T00:00:00","2014-11-28T00:00:00","2014-12-01T00:00:00","2014-12-02T00:00:00","2014-12-03T00:00:00","2014-12-04T00:00:00","2014-12-05T00:00:00","2014-12-08T00:00:00","2014-12-09T00:00:00","2014-12-10T00:00:00","2014-12-11T00:00:00","2014-12-12T00:00:00","2014-12-15T00:00:00","2014-12-16T00:00:00","2014-12-17T00:00:00","2014-12-18T00:00:00","2014-12-19T00:00:00","2014-12-22T00:00:00","2014-12-23T00:00:00","2014-12-24T00:00:00","2014-12-26T00:00:00","2014-12-29T00:00:00","2014-12-30T00:00:00","2014-12-31T00:00:00","2015-01-02T00:00:00","2015-01-05T00:00:00","2015-01-06T00:00:00","2015-01-07T00:00:00","2015-01-08T00:00:00","2015-01-09T00:00:00","2015-01-12T00:00:00","2015-01-13T00:00:00","2015-01-14T00:00:00","2015-01-15T00:00:00","2015-01-16T00:00:00","2015-01-20T00:00:00","2015-01-21T00:00:00","2015-01-22T00:00:00","2015-01-23T00:00:00","2015-01-26T00:00:00","2015-01-27T00:00:00","2015-01-28T00:00:00","2015-01-29T00:00:00","2015-01-30T00:00:00","2015-02-02T00:00:00","2015-02-03T00:00:00","2015-02-04T00:00:00","2015-02-05T00:00:00","2015-02-06T00:00:00","2015-02-09T00:00:00","2015-02-10T00:00:00","2015-02-11T00:00:00","2015-02-12T00:00:00","2015-02-13T00:00:00","2015-02-17T00:00:00","2015-02-18T00:00:00","2015-02-19T00:00:00","2015-02-20T00:00:00","2015-02-23T00:00:00","2015-02-24T00:00:00","2015-02-25T00:00:00","2015-02-26T00:00:00","2015-02-27T00:00:00","2015-03-02T00:00:00","2015-03-03T00:00:00","2015-03-04T00:00:00","2015-03-05T00:00:00","2015-03-06T00:00:00","2015-03-09T00:00:00","2015-03-10T00:00:00","2015-03-11T00:00:00","2015-03-12T00:00:00","2015-03-13T00:00:00","2015-03-16T00:00:00","2015-03-17T00:00:00","2015-03-18T00:00:00","2015-03-19T00:00:00","2015-03-20T00:00:00","2015-03-23T00:00:00","2015-03-24T00:00:00","2015-03-25T00:00:00","2015-03-26T00:00:00","2015-03-27T00:00:00","2015-03-30T00:00:00","2015-03-31T00:00:00","2015-04-01T00:00:00","2015-04-02T00:00:00","2015-04-06T00:00:00","2015-04-07T00:00:00","2015-04-08T00:00:00","2015-04-09T00:00:00","2015-04-10T00:00:00","2015-04-13T00:00:00","2015-04-14T00:00:00","2015-04-15T00:00:00","2015-04-16T00:00:00","2015-04-17T00:00:00","2015-04-20T00:00:00","2015-04-21T00:00:00","2015-04-22T00:00:00","2015-04-23T00:00:00","2015-04-24T00:00:00","2015-04-27T00:00:00","2015-04-28T00:00:00","2015-04-29T00:00:00","2015-04-30T00:00:00","2015-05-01T00:00:00","2015-05-04T00:00:00","2015-05-05T00:00:00","2015-05-06T00:00:00","2015-05-07T00:00:00","2015-05-08T00:00:00","2015-05-11T00:00:00","2015-05-12T00:00:00","2015-05-13T00:00:00","2015-05-14T00:00:00","2015-05-15T00:00:00","2015-05-18T00:00:00","2015-05-19T00:00:00","2015-05-20T00:00:00","2015-05-21T00:00:00","2015-05-22T00:00:00","2015-05-26T00:00:00","2015-05-27T00:00:00","2015-05-28T00:00:00","2015-05-29T00:00:00","2015-06-01T00:00:00","2015-06-02T00:00:00","2015-06-03T00:00:00","2015-06-04T00:00:00","2015-06-05T00:00:00","2015-06-08T00:00:00","2015-06-09T00:00:00","2015-06-10T00:00:00","2015-06-11T00:00:00","2015-06-12T00:00:00","2015-06-15T00:00:00","2015-06-16T00:00:00","2015-06-17T00:00:00","2015-06-18T00:00:00","2015-06-19T00:00:00","2015-06-22T00:00:00","2015-06-23T00:00:00","2015-06-24T00:00:00","2015-06-25T00:00:00","2015-06-26T00:00:00","2015-06-29T00:00:00","2015-06-30T00:00:00","2015-07-01T00:00:00","2015-07-02T00:00:00","2015-07-06T00:00:00","2015-07-07T00:00:00","2015-07-08T00:00:00","2015-07-09T00:00:00","2015-07-10T00:00:00","2015-07-13T00:00:00","2015-07-14T00:00:00","2015-07-15T00:00:00","2015-07-16T00:00:00","2015-07-17T00:00:00","2015-07-20T00:00:00","2015-07-21T00:00:00","2015-07-22T00:00:00","2015-07-23T00:00:00","2015-07-24T00:00:00","2015-07-27T00:00:00","2015-07-28T00:00:00","2015-07-29T00:00:00","2015-07-30T00:00:00","2015-07-31T00:00:00","2015-08-03T00:00:00","2015-08-04T00:00:00","2015-08-05T00:00:00","2015-08-06T00:00:00","2015-08-07T00:00:00","2015-08-10T00:00:00","2015-08-11T00:00:00","2015-08-12T00:00:00","2015-08-13T00:00:00","2015-08-14T00:00:00","2015-08-17T00:00:00","2015-08-18T00:00:00","2015-08-19T00:00:00","2015-08-20T00:00:00","2015-08-21T00:00:00","2015-08-24T00:00:00","2015-08-25T00:00:00","2015-08-26T00:00:00","2015-08-27T00:00:00","2015-08-28T00:00:00","2015-08-31T00:00:00","2015-09-01T00:00:00","2015-09-02T00:00:00","2015-09-03T00:00:00","2015-09-04T00:00:00"], "Elements":[{"Currency":"USD","TimeStamp":null,"Symbol":"GOOGL","Type":"price","DataSeries":{"close":{"min":497.06,"max":699.62,"maxDate":"2015-07-17T00:00:00","minDate":"2015-01-12T00:00:00","values":[597.78,601.63,591.97,593.42,591.11,584.9,581.64,588.78,593.29,597.27,605.4,597.27,591.18,598.42,585.25,587.9,587.81,588.41,579.63,580.88,586.25,587.78,574.1,583.74,570.81,555.19,544.75,548.69,540.73,536.92,522.97,532.38,538.03,542.69,553.65,548.9,549.88,558.94,558.45,560.27,567.87,563.77,564.19,555.95,551.69,551.82,558.23,561.29,558.25,556.44,555.19,546.64,544.51,547.2,543.76,545.89,547.48,549.23,547.73,549.08,539.65,538.59,536.97,542.58,528.08,530.73,536.11,528.04,532.11,521.51,515.84,498.16,506.45,514.62,520.04,532.3,538.77,536.93,541.52,537.31,535.28,530.66,529.55,519.46,506.64,505.15,506.91,500.72,497.06,501.8,505.93,504.01,510.455,509.94,520.39,537.3,541.95,536.72,521.19,512.43,513.23,537.55,532.2,533.3,526.1,529.83,533.875,529.28,540.16,538,546.01,551.16,545.01,542.65,546.45,541.8,535,538.65,547.33,559.29,562.63,575.02,578.795,578.33,581.435,572.9,574.1,559.85,555.69,561.17,553,561.64,557.61,566.16,563.67,564.95,565.37,577.54,567,563.64,557.55,561.135,554.7,549.49,541.31,543.95,544.86,548.84,548.02,548.54,548.64,539.78,541.04,543.52,532.74,544.53,542.925,549.18,557.46,573.66,566.12,564.37,561.39,548.77,551.16,552.84,543.045,535.08,542.04,548.95,545.78,538.73,539.49,549.2,546.49,546.67,549.28,552.51,556.81,554.52,547.19,554.25,554.18,545.32,549.21,553.95,555.29,551.69,549.53,543.48,542.16,552.6,550.04,547.47,543,544.87,546.6,556.18,557.52,559.68,563.39,558.57,557.95,553.06,541.25,540.04,543.3,547.34,545.62,550.03,541.7,544.65,556.11,571.73,584.18,583.96,601.78,699.62,692.84,695.35,695.1,674.73,654.77,658.27,659.66,661.43,664.56,657.5,664.72,661.28,673.29,670.15,664.39,663.14,690.3,691.47,686.51,689.37,694.11,688.73,694.04,679.48,644.03,618.11,612.47,659.74,667.96,659.69,647.82,629.56,644.91,637.05,629.075]}}}]}

    dict set state response status 200

    # puts [dict? $state response]
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
