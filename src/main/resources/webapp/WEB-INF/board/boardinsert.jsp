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
<title>게시판 작성</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container">
		<br>
		<h1>추천 게시판글 작성하기</h1>
		<br>
		<div class="panel panel-default">
			<form action="/boardsuccess" method="post" class="panel-body">
				<div class="form-group">
					<label for="id">제목</label> <input type="text" class="form-control"
						id="title" name="title" placeholder="책제목">
				</div>
				<textarea class="form-control" placeholder="감상평" rows="10"
					id="content" name="content"></textarea>

				<button type="submit" class="btn btn-default">확인</button>
				<button class="btn btn-default">취소</button>
			</form>
		</div>
	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
</body>
</html>