$('document').ready(function() {

	// Disable cut copy and paste
	$('.js_time').bind('cut copy paste', function(f) {
		f.preventDefault();
	});

	// Validates typing and time format
	$('.js_time').timefield();

	// Calculate total time
	$('.js_time').total_os();

  // Filter
  $('.filter').table_filter();

	// Disable editing
	$('#service_order_total_time').attr("readonly", true);

	$("#datepicker").datepicker();

})
