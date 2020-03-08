<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>내 강좌</title>
<script>
</script>
</head>
<body ng-app='course'>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/jsp/fixedIndex/nav.jsp" />
		<jsp:include page="/WEB-INF/jsp/fixedIndex/toggleSidebar.jsp" />
		<br><br>
		<jsp:include page="/WEB-INF/jsp/fixedIndex/menuButton.jsp" />		
		<div class="container">
		<h3>수강 중인 강좌 리스트</h3>
		<c:forEach var="cos" items="${course}">
			<a href="/course/intro/${cos.cosno}">${cos.cosname}</a> &ensp;&ensp;  
			<button type="button" class="btn btn-default" onClick="location.href='/course/subscribeCancel/${cos.cosno}'">수강 취소</button>
			<br>
		</c:forEach> 
			
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>		
		<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp"%>
	
	</div>
</body>
</html>