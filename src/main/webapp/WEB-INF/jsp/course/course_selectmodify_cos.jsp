<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>수정 코스 선택</title>
<script>
	function selectcourse() {
		var obj = document.getElementById("cosno");
		var cosno = obj.options[obj.selectedIndex].value;

		location.href = "/course/modifycourse/" + cosno;

	}
</script>
</head>
<body>

	<div id="wrapper">
		<jsp:include page="/WEB-INF/jsp/fixedIndex/nav.jsp" />
		<jsp:include page="/WEB-INF/jsp/fixedIndex/toggleSidebar.jsp" />

		<br>
		<br>
		<jsp:include page="/WEB-INF/jsp/fixedIndex/menuButton.jsp" />
		<br>
		<br>
		<br>
		<div class="container">
			<H3>수정할 코스 선택</H3>
			<select name="cosno" id="cosno">
				<c:forEach var="course" items="${allcourse}">
					<option value="${course.cosno}">${course.cosno}/
						${course.cosname}</option>
				</c:forEach>
			</select> <input type="button" class="btn btn-default"
				onclick="selectcourse();" value="선택" />
		</div>
		<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp"%>
	</div>
</body>
</html>