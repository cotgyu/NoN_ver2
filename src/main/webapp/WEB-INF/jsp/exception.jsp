<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>NoN</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <meta name="description" content="">
<meta name="author" content=""> -->

<!-- Bootstrap core CSS -->
<!--toggle-->
<link href="resources/indexresource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/indexresource/css/simple-sidebar.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="resources/indexresource/vendor/jquery/jquery.min.js"></script>
<!--toggle -->
<script src="resources/indexresource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<style>
</style>

</head>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/jsp/fixedIndex/nav.jsp" />
		<jsp:include page="/WEB-INF/jsp/fixedIndex/toggleSidebar.jsp" />
		<jsp:include page="/WEB-INF/jsp/fixedIndex/header.jsp" />
		<jsp:include page="/WEB-INF/jsp/fixedIndex/menuButton.jsp" />

		<!-- Page Contents -->
		<div class="container" style="margin-bottom: 300px">
			<c:if test="${not empty code}">
				<div>
				<c:if test="${code eq '404'}">
					<h4>페이지를 찾을 수 없습니다.</h4>
				</c:if>

				<c:if test="${code eq '403'}">
					<h4>접근 권한이 없습니다.</h4>
				</c:if>

				<c:if test="${code eq '500'}">
					<h4>서버의 상태에 확인 필요합니다.</h4>
				</c:if>

				<c:if test="${code eq '503'}">
					<h4>서버의 상태에 확인 필요합니다.</h4>
				</c:if>
				</div>

			</c:if>

			<br>
			<h4>관리자에게 문의하세요!</h4>
		</div>


		<jsp:include page="/WEB-INF/jsp/fixedIndex/footer.jsp" />
	</div>
	<!-- /#wrapper -->



</body>
</html>