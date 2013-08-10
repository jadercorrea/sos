(function($) {
	$.fn.total_os = function() {
		$(this).change(function(key){
			 	var startField  = $('#service_order_start_time');
		    var endField    = $('#service_order_end_time');
		    var minusField  = $('#service_order_non_billable_hours');
		    var plusField   = $('#service_order_other_billable_hours');
		    var totalField  = $('#service_order_total_time');
		    var RegExp      = /(\.)([\d]{2})/;
		    var aStart      = [0,0];
		    var aEnd        = [0,0];
		    var aPlus       = [0,0];
		    var aMinus      = [0,0]; 
		    var min         = 0;
		    var total       = 0; 

		    if ((startField.val().length == 5) && (endField.val().length == 5)) {
		        aStart[0]   = parseInt(startField.val().slice(0,2), '10');
		        aStart[1]   = parseInt(startField.val().slice(3,5), '10');
		        aEnd[0]     = parseInt(endField.val().slice(0,2), '10');
		        aEnd[1]     = parseInt(endField.val().slice(3,5), '10');
		    }
		    if (plusField.val().length == 5) {
		        aPlus[0]   = parseInt(plusField.val().slice(0,2), '10');
		        aPlus[1]   = parseInt(plusField.val().slice(3,5), '10');
		    }
		    if (minusField.val().length == 5) {
		        aMinus[0]   = parseInt(minusField.val().slice(0,2), '10');
		        aMinus[1]   = parseInt(minusField.val().slice(3,5), '10');
		    }

		    total = (((aEnd[0]*60)+aEnd[1])-((aStart[0]*60)+aStart[1])
		        - ((aMinus[0]*60)+aMinus[1]) + ((aPlus[0]*60)+aPlus[1]))/60;

		    totalField.val(parseInt(total, '10').toString());

		    if (totalField.val().length == 1) {
		        totalField.val('0'+totalField.val());
		    }
		    
		    totalField.val(totalField.val()+':');

		    if (total.toString().match(RegExp) != null) {
		          min = parseInt(total.toString().match(RegExp)[2], '10');
		          min = parseInt(Math.round((min*30)/50)).toString();
		          if (min.length == 1) {
		            min = '0'+min;
		          }
		    } else {
		        if (total - (parseInt(total)) > 0 ) {
		            min = '30';
		        } else {
		            min = '00';
		        }
		    }

		    totalField.val(totalField.val()+min);
		    return true;
		});
	}; 
})(jQuery);