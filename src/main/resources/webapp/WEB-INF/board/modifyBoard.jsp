<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>게시글 수정</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<script src="/resources/js/jquery/jquery.js"></script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container">
		<br>
		<h1>게시글 수정</h1>
		<br>
		<div class="panel panel-default">

			<form action="/modifyBoard" method="post" class="panel-body">
				<div class="form-group">
					<label for="id">제목</label> <input type="text" class="form-control"
						id="title" name="title" placeholder="도서명" value="${board.title }">
				</div>
				<textarea class="form-control" placeholder="감상평" rows="10"
					id="content" name="content" onkeydown="setLine(this);">${board.content}
				 </textarea>

				<input type="hidden" name="boardnum" value="${board.boardnum}">
				 <br>
				<button id="ok" type="submit" class="btn btn-default">확인</button>
				<button id="cancel" class="btn btn-default">취소</button>
			</form>

		</div>
	</div>
	<script>
		function setLine(txa) {
			line = 5 //기본 줄 수

			new_line = txa.value.split("\n").length + 1;
			if (new_line < line)
				new_line = line;

			txa.rows = new_line;
		}

		$(document).ready(function() {
			var boardid = "${board.id}";
			var id = "${id}";
			if (boardid == id) {
				$('ok').show();
				$('cancel').show();
			} else {
				$('#ok').hide();
				$('#cancel').hide();
			}
		});
	</script>
</body>
</html>