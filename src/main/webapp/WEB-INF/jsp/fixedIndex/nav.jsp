<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- css도 같이 포함? -->
<!-- Bootstrap core CSS --> <!--toggle-->
  <link href="/resources/indexresource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">  
  <!-- Custom styles for this template -->
  <link href="/resources/indexresource/css/simple-sidebar.css" rel="stylesheet">
  <!-- Bootstrap core JavaScript -->
  <script src="/resources/indexresource/vendor/jquery/jquery.min.js"></script><!--toggle -->
  <script src="/resources/indexresource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
<c:set var="member" value="${member}" scope="session"/>
<c:set var="grade" value="${grade}" scope="session"/>

  <c:catch>
  	<c:choose>
  		<c:when test="${member.id eq null }">
		  <!-- Navigation -->
		  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		    <div class="container">
		      <a class="navbar-brand" href="/">Edu Project</a>
		      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		        <span class="navbar-toggler-icon"></span>
		      </button>
		      <div class="collapse navbar-collapse" id="navbarResponsive">
		        <ul class="navbar-nav ml-auto">
		          <li class="nav-item active">
		            <a class="nav-link" href="/">Home
		              <span class="sr-only">(current)</span>
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="/login">로그인</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="/m_register">회원가입</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="#">about</a>
		          </li>
		        </ul>
		      </div>
		    </div>
		  </nav>
  		</c:when>
  		<c:otherwise>
  			<c:choose>
  				<c:when test="${grade eq '4'}">
					 <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
					    <div class="container">
					      <a class="navbar-brand" href="/">Edu Project</a>
					      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
					        <span class="navbar-toggler-icon"></span>
					      </button>
					      <div class="collapse navbar-collapse" id="navbarResponsive">
					        <ul class="navbar-nav ml-auto">
					          <li class="nav-item active">
					            <a class="nav-link" href="/">Home
					              <span class="sr-only">(current)</span>
					            </a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link" href="">${member.nick}</a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link" href="/logout">logout</a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link" href="#">about</a>
					          </li>
					        </ul>
					      </div>
					    </div>
					  </nav>
				</c:when>
				<c:otherwise>
						<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
					    <div class="container">
					      <a class="navbar-brand" href="/">Edu Project</a>
					      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
					        <span class="navbar-toggler-icon"></span>
					      </button>
					      <div class="collapse navbar-collapse" id="navbarResponsive">
					        <ul class="navbar-nav ml-auto">
					          <li class="nav-item active">
					            <a class="nav-link" href="/">Home
					              <span class="sr-only">(current)</span>
					            </a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link" href="">${member.nick}</a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link" href="/logout">logout</a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link" href="#">about</a>
					          </li>
					        </ul>
					      </div>
					    </div>
					  </nav>
				</c:otherwise>	
			</c:choose>
		</c:otherwise>
	</c:choose>
</c:catch>			
  <!--Navigation-->
