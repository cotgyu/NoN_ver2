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
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">

</head>
<style type="text/css">
body {
	padding-top: 70px;
}
</style>
<body>
	<jsp:include page="../nav.jsp" />

	<div class="container ">

		<div class="row panel panel-default">
			<div id="searchResultArea col-md-12 col-xs-12 col-sm-9">

				<br>
				<h2>&nbsp;공지사항</h2>


			</div>
			<div class="row" id="bulletin">
				<table class="table table-bordered">
					<thead class="title">
						<tr>
							<td class="author">등록일</td>
							<td>내용</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${noticeList}" var="notice" varStatus="status">
							<tr style="padding-bottom: 10px">
								<td align="left">${notice.regisdate}</td>

								<td style="width: 80%; height: auto; padding-left: 10px"><textarea
										class="content ellipsis" id="content" name="content"
										style="width: 100%;" rows="5" readonly>${notice.content }</textarea>
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
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {

			$('#dataTable').DataTable({
				"pageLength" : 10,
				paging : true,
				ordering : true,
			});
		});
	</script>
</body>
</html>
