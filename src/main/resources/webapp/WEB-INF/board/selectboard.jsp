<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${boardList}" var="board">
	<div class="board col-6 col-sm-6 col-lg-4">
		<h2>${board.title}</h2>
		<p class="content ellipsis">${board.content}</p>
		<p>
			<a class="btn btn-default">펼쳐보기 »</a>
		</p>
	</div>
	<!--/span-->

</c:forEach>
   <script src="/resources/js/common.js"></script>