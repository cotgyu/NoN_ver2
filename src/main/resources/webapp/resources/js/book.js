$('.bestpicker').change(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/bookList", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		data : {
			listType : 'best',
			year : $('#year').val(),
			month : $('#month').val(),
			keyword : $('#keyword').val()
		}, // parameters as plain object
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr
			$('#searchResultArea').empty().append(data);
		}
	});
});

$('.datepicker').change(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/bookList", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		data : {
			listType : 'new',
			datepicker1 : $('#datepicker1').val(),
			datepicker2 : $('#datepicker2').val(),
			keyword : $('#keyword').val()
		}, // parameters as plain object
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr
			
			$('#searchResultArea').empty().append(data);
		}
	});
});

$('.rcmdChk').on(
		'click',
		function() {
			var $row = $(this).closest('tr');
			var $tds = $row.find('td');

			var rcmdChk = "";
			var bookCode = "";
			var bookCode = $(this).closest('tr').children('td.bookCode').text();
			var td_rcmdChk = $(this).closest('tr').children('td.rcmdChk').find(
					'input:checkbox').is(':checked');
			if (td_rcmdChk == true) {
				td_rcmdChk = '1';
			} else {
				td_rcmdChk = '0';
			}
			$.ajax({
				type : "GET", // GET or POST
				url : "/setRecommend", // URL
				datatype : "xml", // html, xml, json, jsonp, script, text
				data : {
					bookCode : bookCode,
					rcmdChk : td_rcmdChk
				}, // parameters as plain object
				success : function(data, status) { // Ajax complete handelr
					alert('설정 완료');
				}
			});
		});

$('.borrowRequest').on('click', function() {
			var $row = $(this).closest('tr');
			var $tds = $row.find('td');
   
			var bookCode = $(this).val();
			if (bookCode == '') {
				bookCode = $('#bookCode').text();
			} 
			$.ajax({
				type : "GET", // GET or POST
				url : "/borrowbook", // URL
				datatype : "xml", // html, xml, json, jsonp, script, text
				data : {
					bookCode : bookCode, 
				}, // parameters as plain object
				success : function(data, status) { // Ajax complete handelr
					if (data == 'fail') {
						alert('대출이 불가합니다.');
					} else {
						alert('대출승인요청되었습니다.');
					}
					top.location.href = '/bookList' ;
				}
			});
		});
$('.borrow1').on('click', function() {  
    var listType = $('#listType').val();
    var keyword = $('#keyword').val();  
    var	bookCode = $('#bookCode').text();  
    $.ajax({
		type : "GET", // GET or POST
		url : "/borrowbook", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data : {
			bookCode : bookCode,
			listType : listType,
			keyword : keyword }, // parameters as plain object 
		success : function(data, status) { // Ajax complete handelr 
			if(data=='fail'){ 
				alert('대출이 불가합니다.');				 
			}else{
				alert('대출승인 요청되었습니다.');
// 				if(listType!=''){
// 					opener.location.href='/searchBook?listType='+listType+'&keyword='+keyword;
// 				}
				self.close();
			}			
		}		
    });    
});
$('.borrowRequest').on('click',function() {
			var listType = $('#listType').val();
			var keyword = $('#keyword').val();
			var bookCode = $('#bookCode').text();
			$.ajax({
				type : "GET", // GET or POST
				url : "/borrowbook", // URL
				datatype : "xml", // html, xml, json, jsonp,
									// script, text
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				data : {
					bookCode : bookCode,
					listType : listType,
					keyword : keyword
				}, // parameters as plain object
				success : function(data, status) { // Ajax
													// complete
													// handelr
					if (data == 'fail') {
						alert('대출이 불가합니다.');
					} else {
						alert('대출승인요청되었습니다.');
						opener.location.href = '/searchBook?listType='
								+ listType
								+ '&keyword='
								+ keyword;
						self.close();
					}
				}
			});
		});
$('.borrow2').on('click', function() {

	var listType = $('#listType').val();
	var keyword = $('#keyword').val();
	var bookCode = $('#bookCode').text();
	$.ajax({
		type : "GET", // GET or POST
		url : "/borrowbook", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		data : {
			bookCode : bookCode,
			listType : listType,
			keyword : keyword
		}, // parameters as plain object
		success : function(data, status) { // Ajax complete handelr
			if (data == 'fail') {
				alert('대출이 불가합니다.');
			} else {
				alert('대출승인요청되었습니다.');
				self.close();
			}
		}
	});
});
$('#bestBook').click(function() {
	$.ajax({

		type : "GET", // GET or POST
		url : "/bookList", // URL
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
			$('#container').empty().append(data);
			$('table.highchart').highchartTable();
		}
	});
});

$('#btn_bookList').click(function() {
	$.ajax({
		type : "GET", // GET or POST
		url : "/bookList", // URL
		datatype : "xml", // html, xml, json, jsonp, script, text
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr
			$('#goodPhrase').fadeOut();
			$('#image1').fadeOut();
			$('#image2').fadeOut();
			$('#searchResultArea').empty().append(data);
			$('#container').empty().append(data);
		}
	});
});

$('#btn_search').click(function() {
	$.ajax({
		type : "get", // get or post
		url : "/searchBook",
		datatype : "json", // html, xml, json, jsonp, script,
		data : {
			keyword : $('#keyword').val(),
			datepicker1 : $('#datepicker1').val(),
			datepicker2 : $('#datepicker2').val(),
		},
		success : function(data, status) {
			$('#dataTable_wrapper').empty().append(data);
		}// ajax complete handelr gourl(url);
	}); // parameters as plain

});

$('#datepicker1').click(function() {
	$.ajax({
		type : "get", // get or post
		url : "/searchBook",
		datatype : "json", // html, xml, json, jsonp, script,
		data : {
			keyword : $('#keyword').val(),
			datepicker1 : $('#datepicker1').val(),
			datepicker2 : $('#datepicker2').val(),
		},
		success : function(data, status) {
			$('#dataTable_wrapper').empty().append(data);
		}// ajax complete handelr gourl(url);
	}); // parameters as plain
});
$('#datepicker2').click(function() {
	$.ajax({
		type : "get", // get or post
		url : "/searchBook",
		datatype : "json", // html, xml, json, jsonp, script,
		data : {
			keyword : $('#keyword').val(),
			datepicker1 : $('#datepicker1').val(),
			datepicker2 : $('#datepicker2').val(),
		},
		success : function(data, status) {
			$('#dataTable_wrapper').empty().append(data);
		}// ajax complete handelr gourl(url);
	}); // parameters as plain
});
$("#group1").change(function() {
	var options = $(this).val(); 
	$.ajax({
		type : "get", // get or post
		url : "/bookList",
		datatype : "json", // html, xml, json, jsonp, script,
		data : {
			listType : '',
			keyword : $('#keyword').val(),
			group2 : $('#group2').val(),
			group1 : options
		},
		success : function(data, status) {
			$('#searchResultArea').empty().append(data);			
		}// ajax complete handelr gourl(url);
	}); // parameters as plain
	 
});

$("#group2").change(function() {
	var options = $(this).val(); 
	$.ajax({
		type : "get", // get or post
		url : "/bookList",
		datatype : "json", // html, xml, json, jsonp, script,
		data : {
			listType : '',
			keyword : $('#keyword').val(),
			group1 : $('#group1').val(),
			group2 : options
		},
		success : function(data, status) {
			$('#searchResultArea').empty().append(data);
		}// ajax complete handelr gourl(url);
	}); // parameters as plain
	 
}); 

$('#getBookFromISBN').click(function() {
	getBookFromISBN();
}) 

function getBookFromISBN(){
	$.ajax({
		type : "GET", // GET or POST
		url : "/getBookFromISBN", // URL
		datatype : "json", // html, xml, json, jsonp, script, text
		data : {
			keyword : $('#isbn').val(),
			type : $('#type').val()
		},
		error : function() { // Ajax error handler
			alert('ajax failed');
		},
		success : function(data, status) { // Ajax complete handelr]
			$(data).each(function(index,item){                
                $('#title').val(item.title);                
                $('#group1').val(item.group1);
                $('#group2').val(item.group2);
                $('#publish').val(item.publish);
                $('#author').val(item.author);
                $('#summary').val(item.summary);
                $('#price').val(item.price);
            });
		}
	});
}

$('#group2').change(function() {
	var bookCode = $('#group1').val().substr(0, 1)
				+ this.value.substr(0, 3) + '-';
		$('#bookCode').val(bookCode);
		$('#bookCode').focus();
		
		$.ajax({
			type : "GET", // GET or POST
			url : "/getMaxSer", // URL
			datatype : "json", // html, xml, json, jsonp, script, text
			data : {
				group1 : $('#group1').val(),
				group2 : $('#group2').val()
			},
			error : function() { // Ajax error handler
				alert('ajax failed');
			},
			success : function(data, status) { // Ajax complete handelr]
				$(data).each(function(index,item){
					$('#bookCode').val(item.bookCode); 
                });
			}
		}); 
});