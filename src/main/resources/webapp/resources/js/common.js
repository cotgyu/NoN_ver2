
function del() {
	alert("삭제되었습니다.");
}
function rentStop() {
	alert("대출정지 되었습니다.");
}
function borrow() {
	alert("대출 요청되었습니다.");
}
function cancel() {
	alert("취소되었습니다.");
}
function ok() {
	alert("승인되었습니다.");
}
function re_turn() {
	alert("반납되었습니다.");
}
function notifiReser() {
	alert("예약알림문자가 전송되었습니다.");
}



$("#allCheck").click(function() {
	if ($("#allCheck").prop("checked")) {
		$("input[type=checkbox]").prop("checked", true);
	} else {
		$("input[type=checkbox]").prop("checked", false);
	}

})
$('.board .btn').click(function() {
	$(this).parent().parent().find('.content').toggleClass('ellipsis');
});



 
