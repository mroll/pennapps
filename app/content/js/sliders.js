$("#k-slider").slider({
    id: "dataTrack",
    value: 0,
    orientation: 'vertical',
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
    changeFunc();
});

$("#r-slider").slider({
    id: "dataTrack",
    min: 0.001,
    max: 0.999,
    step: 0.001,
    value: 0,
    orientation: 'vertical',
    tooltip_position: 'left',
    formatter: function (value) {
        return 'Current value: ' + value;
    },
    reversed: true
}).on('slideStop', function (ev) {
    changeFunc();
});

$("#v-slider").slider({
    id: "dataTrack",
    min: 0.001,
    max: 0.999,
    step: 0.001,
    value: 0,
    orientation: 'vertical',
    tooltip_position: 'left',
    formatter: function (value) {
        return 'Current value: ' + value;
    },
    reversed: true
}).on('slideStop', function (ev) {
    changeFunc();
});

$("#t-slider").slider({
    id: "dataTrack",
    min: 0.001,
    max: 0.999,
    step: 0.001,
    value: 0,
    orientation: 'vertical',
    tooltip_position: 'left',
    formatter: function (value) {
        return 'Current value: ' + value;
    },
    reversed: true
}).on('slideStop', function (ev) {
    changeFunc();
});

var currentPrice = function(cc) {
    var currentPrice = null;
    var data = "symbol=" + $("#symbol").val();
    $.post("quote", data, function(data) {
        cc(JSON.parse(data)["LastPrice"]);
    });
}

function changeFunc() {
    currentPrice(function(S) {
        var K = parseFloat($("#k-slider").val());
        var t = parseFloat($("#t-slider").val());
        var v = parseFloat($("#v-slider").val());
        var r = parseFloat($("#r-slider").val());

        var data = "S=" + S + "&K=" + K + "&t=" + t + "&v=" + v + "&r=" + r;
        console.log(data);
        
        $.post("optimumprices", data, function(data) {
            console.log(data);
        });
    });
}

//<br /><h5><span class='label label-default'>New</span></h5>
