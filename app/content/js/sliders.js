var slidersArray = ["k-slider", "r-slider", "v-slider", "t-slider"];
for (var i = 0; i < slidersArray.length; i++) {
    $("#slider-container").append("<div class='col-md-1 clearfix' style='width: 12%; margin-bottom: 10px;'><input id=" +
        slidersArray[i] + " type='text' /></div>");
}

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
