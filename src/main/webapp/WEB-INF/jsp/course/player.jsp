<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${course.cosname}_Player</title>
<script>
</script>
  <!-- Bootstrap core CSS --> <!--toggle-->
  <link href="/resources/indexresource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">  
  <!-- Custom styles for this template -->
  <link href="/resources/indexresource/css/simple-sidebar.css?ver=1.1" rel="stylesheet">
  <!-- Bootstrap core JavaScript -->
  <script src="/resources/indexresource/vendor/jquery/jquery.min.js"></script><!--toggle -->
  <script src="/resources/indexresource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 
  </head>
<body>
<div id="wrapper">
<!-- 강의 목록 -->
	<div id="sidebar"><!-- 사이드부분  공간 처리 할것 -->
		
			<ul class="player-sidebar-nav">
				<li class="player-sidebar-brand"></li> <!--  공백 처리 다시 할것 -->
				
				<li class="player-sidebar-brand">
					<h3>${course.cosname}</h3>
				</li>
				<c:forEach var="lec" items="${lecturelist}">
				<li>
					<a href="/course/player/${lec.cosno}/${lec.lecno}">${lec.lecname}
					&nbsp;
					<input type="checkbox" id="check${lec.cosno}" 
					style=" width: 25px;
							height: 25px;
							border: 4px solid #bcbcbc;
							cursor: pointer;"/>
					</a>
				</li>
				
				</c:forEach>
			</ul>
	</div>
			
<br>
<div class="container">
	<div>
		<button type="button" class="btn btn-default" onClick="location.href='/course/intro/${course.cosno}'">강좌로 돌아가기</button>
	</div>



<h3>${lecture.lecname}</h3>
<br>
<iframe src="https://www.youtube.com/embed/${lecture.lecvideo}" height="800" width="1200" allowfullscreen="allowfullscreen"></iframe>


<br><br><br><br><br><br>
	<div>
		<h3>질문과 답변(예정)</h3><br>
	</div>
</div>
<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp" %>
</div>
</body>
</html>