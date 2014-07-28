$('document').ready(function() {

	// Disable cut copy and paste
	$('.js_time').bind('cut copy paste', function(f) {
		f.preventDefault();
	});

	// Validates typing and time format
	$('.js_time').timefield();

	// Calculate total time
	$('.js_time').total_os();

	// Disable editing
	$('#service_order_total_time').attr("readonly", true);

	$("#datepicker").datepicker({
    dateFormat: 'dd/mm/yy',
    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sabado','Domingo'
        ],
    dayNamesMin: [
    'D','S','T','Q','Q','S','S','D'
    ],
    dayNamesShort: [
    'Dom','Seg','Ter','Qua','Qui','Sex','Sab','Dom'
    ],
    monthNames: [  'Janeiro','Fevereiro','Marco','Abril','Maio','Junho','Julho','Agosto','Setembro',
    'Outubro','Novembro','Dezembro'
    ],
    monthNamesShort: [
    'Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set',
    'Out','Nov','Dez'
    ],
    nextText: 'Proximo',
    prevText: 'Anterior'
    });

})
