<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>추천 게시판</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap-select.min.css" rel="stylesheet">
<link href="/resources/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<!-- Page Content -->
	<div id="divLoadBody" class="container">
		<div class="col-md-12">
			<div class="panel panel-default ">
				<div class="panel-body">
					<div class="col-md-7 col-lg-7">
						<h2>&nbsp;추천 게시판</h2>
					</div>
					<div style="float: right; margin-top: 15px"
						class="col-md-5 col-lg-5">
						<button style="float: right; paddig-top: 15px"
							class="btn btn-default" onclick="location.href='/boardwrite'">
							글쓰기</button>
					</div>
					<div id="searchResultArea">
						<div class="dataTable_wrapper">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<td class="genre">등록일</td>
										<td>제목</td>
										<td class="genre">작성자</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${boardList}" var="board" varStatus="status">
										<tr style="padding-bottom: 10px">
											<td align="left"><fmt:parseDate
													value="${board.modifidate}000000" pattern="yyyyMMddHHmmss"
													var="modifidate" scope="page" /> <fmt:formatDate
													value="${modifidate}" pattern="yyyy-MM-dd" /></td>
											<td><a
												href="/selectBoardnum?boardnum=${board.boardnum }"
												id="title">${board.title}</a></td>
											<td align="left">${board.kname}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/resources/js/jquery/jquery.js"></script>
	<script src="/resources/js/jquery.dataTables.min.js"></script>
	<script src="/resources/js/dataTables.bootstrap.min.js"></script>
	<script src="/resources/js/board.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#dataTable').dataTable({
				"bSort" : false,
				"pageLength" : 10,
				paging : true,
				searching : true,
				info : false
			});
		});
	</script>
</body>
</html>