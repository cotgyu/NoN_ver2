<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>수정 강의 선택</title>
<script>
	function selectlecture() {
		var obj = document.getElementById("lecno");
		var lecno = obj.options[obj.selectedIndex].value;

		location.href = "/course/modifylecture/" + lecno;

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
			<H3>수정할 강의 선택</H3>
			<select name="lecno" id="lecno">
				<c:forEach var="lecture" items="${lecture}">
					<option value="${lecture.lecno}">${lecture.lecno}/ ${lecture.lecname}</option>
				</c:forEach>
			</select> <input type="button" class="btn btn-default"
				onclick="selectlecture();" value="선택" />
		</div>
		<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp"%>
	</div>
</body>
</html>