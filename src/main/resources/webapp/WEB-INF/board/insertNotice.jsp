<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>공지사항 작성</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container">
		<br>
		<h1>공지사항 작성</h1>
		<br>
		<div class="panel panel-default">
			<form action="/insertNotice" method="post" class="panel-body">
				
				<textarea class="form-control" placeholder="공지사항" rows="10"
					id="content" name="content"></textarea>

				<button type="submit" class="btn btn-default">확인</button>
				<button class="btn btn-default">취소</button>
			</form>
		</div>
	</div>
</body>
</html>