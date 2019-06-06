
$('#datepicker').change(function() {
	 var datepicker = $('#datepicker').val();		
	 datepicker = datepicker.substr(0,4)+datepicker.substr(5,2)+datepicker.substr(8,2);
	location.href = 'food?datepicker=' + datepicker;
}); 

$('#datepicker').change(function() {
	 var datepicker = $('#datepicker').val();		
	 datepicker = datepicker.substr(0,4)+datepicker.substr(5,2)+datepicker.substr(8,2);
	 location.href = 'food?datepicker=' + datepicker;
});