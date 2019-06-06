
$('#register').click(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/selectboard", // URL
		datatype : "xml",
		data : {
			per : "register"
		},// html, xml, json, jsonp, script, text
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr]
			$('#bulletin').empty().append(data);
		}
	});

})

$('#title').click(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/selectboard", // URL
		datatype : "xml",
		data : {
			per : "title"
		},// html, xml, json, jsonp, script, text
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr]
			$('#bulletin').empty().append(data);
		}
	});

})
