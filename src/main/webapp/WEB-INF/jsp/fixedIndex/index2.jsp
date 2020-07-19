<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>NoN</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap core CSS -->
<link href="resources/indexresource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/indexresource/css/simple-sidebar.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="resources/indexresource/vendor/jquery/jquery.min.js"></script>
<script src="resources/indexresource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<style>
.star{
width:80px;
height:16px; 
background:url('/resources/img/star.jpg') no-repeat -80px 0;
}

.star span{
display:block;
height:16px; 
background:url('/resources/img/star.jpg') no-repeat left top;
text-indent:-9999em;
}
</style>

</head>

<body>
	<div id="wrapper">
		<jsp:include page="nav.jsp" />
		<jsp:include page="toggleSidebar.jsp" />
		<jsp:include page="header.jsp" />
		<jsp:include page="menuButton.jsp" />

		<!-- Page Contents -->
		<div class="container">
			<h1 class="my-4"></h1>

			<div>
				<h3>새로운 강좌</h3>
				<div class="row">
					<c:forEach var="newcoslist" items="${newcourselist}">
						<div class="col-lg-4 col-sm-6 portfolio-item">
				              <div class="card h-100">
				                <a href="/course/intro/${newcoslist.cosno}"><img class="card-img-top" src="/resources/courseImage/${newcoslist.cospicture}" alt=""></a>
				                <div class="card-body">
				                  <h4 class="cardZ-title">
				                    <a href="/course/intro/${newcoslist.cosno}">${newcoslist.cosname}</a>
				                  </h4>
				                 
				                  <c:choose>
				                  	  <c:when test="${newcoslist.coseval == 0}">
										  <div class='star'>
						                  	<span style="width:0%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${newcoslist.coseval == 1}">
										  <div class='star'>
						                  	<span style="width:20%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${newcoslist.coseval == 2}">
										  <div class='star'>
						                  	<span style="width:40%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${newcoslist.coseval == 3}">
										  <div class='star'>
						                  	<span style="width:60%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${newcoslist.coseval == 4}">
										  <div class='star'>
						                  	<span style="width:80%"></span>
						                  </div>
									  </c:when>
									  <c:when test="${newcoslist.coseval == 5}">
										  <div class='star'>
						                  	<span style="width:100%"></span>
						                  </div>
									  </c:when>               
				                  </c:choose>
				                </div>
				              </div>
				            </div>
					</c:forEach>
				</div>				
			</div>
			<br><br><br>
			
			<div>
				<h3>인기 강좌</h3>
				<div class="row">
					<c:forEach var="popcoslist" items="${popcourselist}">			
				            <div class="col-lg-4 col-sm-6 portfolio-item">
				              <div class="card h-100">
				                <a href="/course/intro/${popcoslist.cosno}"><img class="card-img-top" src="/resources/courseImage/${popcoslist.cospicture}" alt=""></a>
				                <div class="card-body">
				                  <h4 class="cardZ-title">
				                    <a href="/course/intro/${popcoslist.cosno}">${popcoslist.cosname}</a>
				                  </h4>
				                  
				                  <c:choose>
				                  	  <c:when test="${popcoslist.coseval == 0}">
										  <div class='star'>
						                  	<span style="width:0%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${popcoslist.coseval == 1}">
										  <div class='star'>
						                  	<span style="width:20%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${popcoslist.coseval == 2}">
										  <div class='star'>
						                  	<span style="width:40%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${popcoslist.coseval == 3}">
										  <div class='star'>
						                  	<span style="width:60%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${popcoslist.coseval == 4}">
										  <div class='star'>
						                  	<span style="width:80%"></span>
						                  </div>
									  </c:when>
									  <c:when test="${popcoslist.coseval == 5}">
										  <div class='star'>
						                  	<span style="width:100%"></span>
						                  </div>
									  </c:when>               
				                  </c:choose>
				                </div>
				              </div>
				            </div>	            
					</c:forEach>
								
				</div>				
			</div>
			</div>
		
		
		<jsp:include page="footer.jsp" />
	</div>
	<!-- /#wrapper -->



</body>
</html>