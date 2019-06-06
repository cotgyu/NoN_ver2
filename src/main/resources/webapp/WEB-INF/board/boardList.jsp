<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>게시판 관리</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container">

		<div class="col-md-12"><jsp:include page="../menu.jsp" />

			<div class="panel panel-default">
				<div class="panel-body">

					<div>
						<h2>게시판 관리</h2>
					</div>
					<table class="table  table-striped table-bordered">
						<thead>
							<tr class="title">


								<th style="width: 20%;">제목</th>
								<th >내용</th>
								<th class="genre">작성자</th>
								
								<th class="date hidden-xs">최종 수정일</th>
								<th class="genre"></th>
							</tr>

						</thead>
						<tbody>
							<c:forEach items="${boardList}" var="board" varStatus="status">
								<tr>
									<td style="vertical-align: top;">${board.title}</td>
									<td>${board.content}</td>
									<td><c:choose>
											<c:when test="${empty board.kname}">${board.id}</c:when>
											<c:otherwise>${board.kname}</c:otherwise>
										</c:choose></td>
									<td class=" hidden-xs">
									${board.modifidate}</td>
									<td>
										<button class="btn btn-default btn-sm" type="submit"
											id="modifyBoard"
											onClick="location.href='/selectBoardnum?boardnum=${board.boardnum}'">수정</button>

										<button class="btn btn-default btn-sm" type="button"
											id="deleteBoard"
											onClick="location.href='/deleteBoard?boardnum=${board.boardnum}'">삭제</button>
									</td>
								</tr>

							</c:forEach>
						</tbody>


					</table>


				</div>

			</div>
		</div>
	</div>

	<hr>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/book.js"></script>
	<script src="/resources/js/common.js"></script>
	<script>
		function setLine(txa) {
			line = 5 //기본 줄 수

			new_line = txa.value.split("\n").length + 1;
			if (new_line < line)
				new_line = line;

			txa.rows = new_line;
		}
		function del() {
			alert("승인되었습니다.");
		}
	</script>
</body>
</html>