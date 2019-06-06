
$('#btn_request').click(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/requestBook", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		data : {
			keyword : $('#query').val()
		}, // parameters as plain object
		error : function() { // Ajax error handler
			alert(error());
		},
		success : function(data, status) { // Ajax complete handelr
			$('#image1').fadeOut();
			$('#image2').fadeOut();
			$('#searchResultArea').empty().append(data);
		}
	});
});



$('#getBookInfo').click(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/getBookInfo", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			keyword : $('#keyword').val()
		},
		// parameters as plain object
		error : function() { // Ajax error handler

			alert(error());
		},
		success : function(data, status) { // Ajax complete handelr
			$('#searchResultArea').empty().append(data);
			
		}
	});
});