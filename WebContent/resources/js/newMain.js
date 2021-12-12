// Search model
$(".reser-btn-search").on("click", function() {
	$(".booking-continer").fadeIn(500);
	$(".reser-btn").fadeOut(100);
});

$(".search-close-switch2").on("click", function() {
	$(".booking-continer").fadeOut(400);
	$(".reser-btn").fadeIn(400);
});

// datePicker setting

var disabledDays = [];

function disavble(days) {
	disabledDays = days;
};

function disableAllTheseDays(date) {
	var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	for (i = 0; i < disabledDays.length; i++) {
		if ($.inArray(y + "-" + (m + 1) + "-" + d, disabledDays) != -1) {
			return [ false ];
		}
	}
	return [ true ];
}
$(function() {
	$("#today").text(new Date().toLocaleDateString());

	$.datepicker.setDefaults($.datepicker.regional["ko"]);

	$("#fromDate").datepicker({
		showOn : "both",
		minDate : 0,
		buttonImage : "images/calendar.gif",
		buttonImageOnly : true,
		buttonText : "날짜선택",
		dateFormat : "yy-mm-dd",
		changeMonth : true,
		onClose : function(selectedDate) {
			$("#toDate").datepicker("option", "minDate", selectedDate);
		},
		beforeShowDay : disableAllTheseDays,
	});

	$("#toDate").datepicker({
		showOn : "both",
		buttonImage : "images/calendar.gif",
		buttonImageOnly : true,
		buttonText : "날짜선택",
		dateFormat : "yy-mm-dd",
		changeMonth : true,
		onClose : function(selectedDate) {
			$("#fromDate").datepicker("option", "maxDate", selectedDate);
		},
		beforeShowDay : disableAllTheseDays,
	});
});
