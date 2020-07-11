<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${course.cosname} 코스</title>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
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
			
			<!-- 수강버튼 부분
			todo 수강했을때 성공했다고 알람창 띄우기 -->
			<div id="subcheck">
				<sec:authorize access="isAuthenticated()">
					<c:choose>
						<c:when test="${checkstate == false}">					
							<button type="button" class="btn btn-default" onClick="location.href='/course/subscribe/${course.cosno}'">수강하기</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-default">수강 중</button>
						</c:otherwise>
					</c:choose>			
				</sec:authorize>
			</div>
			
			<h3>${course.cosname}</h3> 
			<div class="btn-group">
			  <button type="button" class="btn btn-default" onClick="location.href='#intro'">강좌 소개</button>
			  <button type="button" class="btn btn-default" onClick="location.href='#courselist'">강의리스트</button>
			  <button type="button" class="btn btn-default" onClick="location.href='#eval'">수강후기</button>
		<sec:authorize access="isAuthenticated()">
        <c:choose>
            <c:when test="${checkstate == true}">
              <button type="button" class="btn btn-default" onClick="location.href='/course/player/${course.cosno}/'">이어서 듣기</button>
            </c:when>
        </c:choose>
		</sec:authorize>
			</div>
			<br><br>
			
			<section id="intro">
				<h4>강좌 소개</h4>
				<br>
				<div id="content">
					<iframe src="https://www.youtube.com/embed/${course.cosintrovideo}"
						height="500" width="800" allowfullscreen="allowfullscreen"
						name="fitvid0"></iframe>
						
					<!-- 기본비디오 
					<video width="320" height="240" controls>
					  <source src="/resources/courseInputVideo/RARBG.mp4" type="video/mp4">					
					</video>
					-->
				</div>
				<br>
				${course.cosintro} 
			</section>
			<br><br><br><br><br><br>

			<section id="courselist">
				<h4>강좌 리스트</h4>
				<br>
				<c:forEach var="lec" items="${lecture}">
					<a href="/course/player/${lec.cosno}/${lec.lecno}">${lec.lecname}</a> &ensp;&ensp;  ${lec.lectime}<br>
				</c:forEach> 
				</section>
			<br><br><br><br><br><br>
			
			<h4>수강평</h4>
			<sec:authorize access="isAuthenticated()">
			<section id="eval">
				<h1><span class="evaPrint"></span></h1>
				<!-- 댓글부분 -->
				<label for="content">수강후기를 남겨주세요</label>
					<div class="container" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">
						<form name="commentInsertForm">
							<div class="input-group">
								<input type="hidden" name="cosno" value="${course.cosno}" /> 
								
								<label class="radio-inline">
									<input type="radio" name="eva_count" id="inlineRadio1" value="1"> 1
								</label>
								<label class="radio-inline">
								  	<input type="radio" name="eva_count" id="inlineRadio2" value="2"> 2
								</label>
								<label class="radio-inline">
								  <input type="radio" name="eva_count" id="inlineRadio3" value="3"> 3
								</label>
								<label class="radio-inline">
								  <input type="radio" name="eva_count" id="inlineRadio4" value="4"> 4
								</label>
								<label class="radio-inline">
								  <input type="radio" name="eva_count" id="inlineRadio5" value="5"> 5
								</label>
								
								 
								<div class="input-group input-group-md">
									<input type="text" class="form-control" name="content" placeholder="평점과 내용을 입력하세요."> 
									<span class="input-group-btn">
										<button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
									</span>
								</div>
							</div>
						</form>
					</div>
			</section><br><br>
			</sec:authorize>
			<div class="container">
				<div class="commentList"></div>
			</div>
				<br><br>

			<section id="recommendListSection">
			<c:choose>
				<c:when test="${empty recommendList}">
					<h1>강의 추천을 위해 수강평을 등록해주세요!</h1>
				</c:when>
				<c:otherwise>
					<h1>이런 강의는 어떠세요??</h1>
				</c:otherwise>
			</c:choose>
			<div class="container">
					<c:forEach var="num" varStatus="i" begin="0" end="4" step="1">
						<a href ="/course/intro/${recommendList[num]}">${recommendCourseName[num]}</a><br>
					</c:forEach>
			</div>
			</section>
			<br><br><br><br><br><br>
		</div>
		<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp"%>
		<%@ include file="commentS.jsp" %>
	</div>
</body>
</html>