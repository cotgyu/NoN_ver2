function CommaFormatted(amount) {
	var delimiter = ","; // replace comma if desired
	var a = amount.split('.', 2);
	var d = a[1];
	var i = parseInt(a[0]);
	if (isNaN(i)) {
		return '';
	}
	var minus = '';
	if (i < 0) {
		minus = '-';
	}
	i = Math.abs(i);
	var n = new String(i);
	var a = [];
	while (n.length > 3) {
		var nn = n.substr(n.length - 3);
		a.unshift(nn);
		n = n.substr(0, n.length - 3);
	}
	if (n.length > 0) {
		a.unshift(n);
	}
	n = a.join(delimiter);
	if (d.length < 1) {
		amount = n;
	} else {
		amount = n + '.' + d;
	}
	amount = minus + amount;
	return amount;
}

$('#purchaseMonth').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/selectSumPurchase", // URL
		datatype : "json",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val()
		},
		// parameters as plain object
		error : function() { // Ajax error handler

			alert('검색어를 입력하세요');
		},
		success : function(data, status) { // Ajax complete handelr
			$('#table').empty();
			$('#chart').empty();
			$('#full').empty().append(data);
			$('table.highchart').highchartTable();
			var temp = $('.td-count').val();
			CommaFormatted(temp.substring(0, temp.length - 1));
		}
	});
});
$('#rentByPerson').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/rentByPerson", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val(),
			month : $('#month').val()
		},
		// parameters as plain object
		error : function() { // Ajax error handler

			alert(error());
		},
		success : function(data, status) { // Ajax complete handelr
			$('#full').empty().append(data);
			$('#table').empty();
			$('#chart').empty();
			$('#chart').empty();
			$('table.highchart').highchartTable();
			$('#table').empty();
			$('#table').show("slow");
			CommaFormatted($('.td-count').val().substring(0, temp.length - 1));
		}
	});
});

$('#rentByMonth').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/rentByMonth", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val(),
			month : $('#month').val(),
			which : 'table'
		},
		// parameters as plain object
		error : function() { // Ajax error handler
			alert(error());
		},
		success : function(data, status) { // Ajax complete handelr
			$('#full').empty().append(data);
			// $('#table').empty();
			$('#chart').empty();
			$('table.highchart').highchartTable();
			CommaFormatted($('.td-count').val().substring(0, temp.length - 1));
		}
	});
	$('.highcharts-container').css('display', 'inline');

});

$('#teamCount').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/teamCount", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val(),
			month : $('#month').val()
		},
		// parameters as plain object
		error : function() { // Ajax error handler

			alert(error());
		},
		success : function(data, status) { // Ajax complete handelr
			$('#full').empty();
			$('#table').empty();
			$('#chart').empty();
			$('#full').empty().append(data);
			$('table.highchart').highchartTable();
			CommaFormatted($('.td-count').val().substring(0, temp.length - 1));
		}
	});
});

$('#bookCount').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/bookCount", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val(),
			month : $('#month').val()
		},
		// parameters as plain object
		error : function() { // Ajax error handler

			alert(error());
		},
		success : function(data, status) { // Ajax complete handelr
			$('#full').empty();
			$('#table').empty();
			$('#chart').empty();
			$('#full').empty().append(data);
			$('table.highchart').highchartTable();
			
			var sum = 0;
			var quantity = 0;
			var count = $('.count');
			for (var k = 0; k < count.length; k++) {
				var temp = count.eq(k).text();
				sum += parseInt(temp.substring(0, temp.length - 1));
			}
			$('#total_price').text(sum + "권");
			CommaFormatted($('.td-count').val().substring(0, temp.length - 1));
		}
	});
});

$('#rankGroupByB').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/rankGroupByB", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val(),
			month : $('#month').val()

		},
		// parameters as plain object
		error : function() { // Ajax error handler

			alert(error());
		},
		success : function(data, status) { // Ajax complete handelr
			$('#full').empty();
			$('#table').empty();
			$('#chart').empty();
			$('#full').empty().append(data);
			$('table.highchart').highchartTable();
			CommaFormatted($('.td-count').val().substring(0, temp.length - 1));
		}
	});
});
$('#rankGroupByBook').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/rankGroupByBook", // URL
		datatype : "xml",
		// html, xml, json, jsonp, script, text
		data : {
			year : $('#year').val(),
			month : $('#month').val()

		},
		// parameters as plain object
		error : function() { // Ajax error handler

			alert(error());
		},
		success : function(data, status) { // Ajax complete handelr
			$('#full').empty();
			$('#table').empty();
			$('#chart').empty();
			$('#full').empty().append(data);
			$('table.highchart').highchartTable();
			CommaFormatted($('.td-count').val().substring(0, temp.length - 1));
		}
	});
});
