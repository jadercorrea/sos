(function($) {
	$.fn.timefield = function() {

		$(this).keypress(function(key){
			if (key.which > '31' && (key.which < '48' || key.which > '57')) {
				return false;
			} else {
				// Allow tab key and backspace
				if (key.which == '0' || key.which == '8') {
					return true;
				} else {
					if (this.value.length == 5 
    					|| (this.value.slice(0,1) == '' && key.which >= '51')
    					|| (this.value.length == 1 && this.value.slice(0,1) == '2' && key.which >= '52')
    					|| (this.value.length == 2 && key.which >= '54')
    				) {
						return false;
    				} else {
    					return timeFormat(this);
    				}
				}
			}
		});

	function timeFormat(field) {
	if (field.value.length == 2) {
		field.value += ":";
		}
		return true;	
	}
  }; 
})(jQuery);