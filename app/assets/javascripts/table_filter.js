/* @jader_correa */

(function($) {
  $.fn.table_filter = function(key) {
    $(this).keyup(function() {
      var search = $(this).val();
      var values = split_values(search);
      var x = 0
      var find = false

      $("#table").children('tbody').children('tr').not(':first').each(function(){
        find = false
        x = 0
        
        // To an OR filter type use: x < values.length && find == false

        while (x < values.length) {
          if (($(this).text().indexOf(values[x]) >= 0) && ($(this).css("display") == "table-row")) {
            find = true
          }
          // and filter type only
          else {
            find = false
          }

          x++
        }
        if (find == true || search == ""){
          $(this).show();
        } else {
          $(this).hide();
        }
      });
    });

    function split_values(values) {
      var i, trimmedVal,
        ret = [],
        quotes = split_quotes(values);

      //Remove double quote
      for(i = 0; i<quotes.length; i++) {
        values = values.replaceAll( quotes[i][0], " " );
      }

      //Prepare the return
      if( trimmedVal = values.trim() ) {
        ret = trimmedVal.split(" ");
      }
      for(i = 0; i<quotes.length; i++) {
        ret.push( quotes[i][0].trim() );
      }

    return ret;
  }

  function split_quotes(str) {
    var matches,
      reg = new RegExp("([ ]?\")([^\"*]*)(\"[ ]?)", "g"),
      ret = [];

    while((matches = reg.exec(str)) !== null ) {
      ret.push({
        0: matches[0],
        1: matches[2]
      });
    }
    return ret;
  }

  }
})(jQuery);