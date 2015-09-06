$("#k-slider").slider({
    id: "dataTrack",
    value: 0,
    orientation: 'horizontal',
    tooltip_position: 'left',
    formatter: function (value) {
        return 'Current value: ' + value;
    },
    reversed: true,
    onshow: function() {
        currentPrice(function(S) {
            $(this).value(S);
        });
    }
}).on('slideStop', function (ev) {
    changeFunc("#SliderVal1", "#k-slider");
});

$("#r-slider").slider({
    id: "dataTrack",
    min: 0.001,
    max: 0.999,
    step: 0.001,
    value: 0.001,
    orientation: 'horizontal',
    tooltip_position: 'left',
    formatter: function (value) {
        return 'Current value: ' + value;
    },
    reversed: true
}).on('slideStop', function (ev) {
    changeFunc("#SliderVal2", "#r-slider");
});

$("#v-slider").slider({
    id: "dataTrack",
    min: 0.001,
    max: 0.999,
    step: 0.001,
    value: 0.001,
    orientation: 'horizontal',
    tooltip_position: 'left',
    formatter: function (value) {
        return 'Current value: ' + value;
    },
    reversed: true
}).on('slideStop', function (ev) {
    changeFunc("#SliderVal3", "#v-slider");
});

$("#t-slider").slider({
    id: "dataTrack",
    min: 0.001,
    max: 0.999,
    step: 0.001,
    value: 0.001,
    orientation: 'horizontal',
    tooltip_position: 'left',
    formatter: function (value) {
        return 'Current value: ' + value;
    },
    reversed: true
}).on('slideStop', function (ev) {
    changeFunc("#SliderVal4", "#t-slider");
});

var currentPrice = function(cc) {
    var currentPrice = null;
    var data = "symbol=" + $("#symbol").val();
    $.post("quote", data, function(data) {
        cc(JSON.parse(data)["LastPrice"]);
    });
}

function changeFunc(spanId, sliderId) {
    currentPrice(function(S) {
        var K = parseFloat($("#k-slider").val());
        var t = parseFloat($("#t-slider").val());
        var v = parseFloat($("#v-slider").val());
        var r = parseFloat($("#r-slider").val());

        var data = "S=" + S + "&K=" + K + "&t=" + t + "&v=" + v + "&r=" + r;
        
        $.post("optimumprices", data, function(data) {
            var vals = data.split(" ");
            $("#optimum-call").text(vals[0]);
            $("#optimum-put").text(vals[1]);
        });

        $(spanId).text($(sliderId).val());
    });
}

//<br /><h5><span class='label label-default'>New</span></h5>
