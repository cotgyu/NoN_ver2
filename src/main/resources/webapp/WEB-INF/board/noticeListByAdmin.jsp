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
<title>공지사항</title>
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

					<div class="left">
						<h2>공지사항</h2>
					</div>
					<div class="right title">
						<p align="right">
							<!-- 							<button class="btn btn-default" type="button" -->
							<!-- 								onClick="location.href='/writeNotice'">추가</button> -->
					</div>

					<form action="/modifyNotice" method="post">
						<table class="table table-bordered" id="dataTable">
							<thead class="title">
								<tr>
									<th class="hidden-xs genre">등록일</th>
									<th style="width: 80%">내용</th>
									<th class="genre" hidden="true"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noticeList}" var="notice" varStatus="status">
									<tr style="padding-bottom: 10px">
										<td class="hidden-xs" width="10%" align="left">
											${notice.regisdate}</td>
										<td hidden="true"><input name="boardnum"
											value="${notice.boardnum}" hidden="true"></td>
										<td style="width: 80%; height: auto; padding-left: 10px"><textarea
												class="content ellipsis" id="content" name="content"
												style="width: 100%;" rows="5">${notice.content }</textarea>
										</td>
										<td style="width: 10%"><button
												class="btn btn-default btn-sm" type="submit"
												id="modifyNotice">수정</button>
											<button class="btn btn-default btn-sm" type="button"
												id="deleteNotice"
												onClick="location.href='/deleteNotice?boardnum=${notice.boardnum}'">삭제</button>
										</td>
									</tr> 
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>


			</div>
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
		function modify() {
			alert("수정되었습니다.");
		}
	</script>
</body>
</html>