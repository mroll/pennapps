$("#k-slider").slider({
    id: "dataTrack",
    min: 0,
    max: 10,
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
$("#r-slider").slider({
    id: "dataTrack",
    min: 0,
    max: 10,
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
    min: 0,
    max: 10,
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
    min: 0,
    max: 10,
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

function changeFunc() {
    $.ajax({
            method: "POST",
            url: "server/bs.tcl",
            data: $("#k-slider").slider('getValue')
        })
        .done(function (msg) {
            alert("Data Saved: " + msg);
        });
}

//<br /><h5><span class='label label-default'>New</span></h5>
