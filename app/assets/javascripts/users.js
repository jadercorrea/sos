$( document ).ready(function() {   

  var mostra_clientes = function() {
    if ($("option:selected", "#user_role_id").text() == "Cliente") {
      $("div.field.client_id").show();
    } else {
      $("div.field.client_id").hide();
    }
  }

  $("#user_role_id").change(function(event) { 
    mostra_clientes();    
  });
  mostra_clientes();
});