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

//<br /><h5><span class='label label-default'>New</span></h5>
