<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="member" value="${member}" scope="session"/>
<c:set var="grade" value="${grade}" scope="session"/>

<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="#"> 공백...(수정해야함..) </a></li>
				<li><a href="/course/list">분야별 강좌</a></li>
				<li><a href="#">질문과 답변</a></li>
				<c:if test="${not empty member.id}">
					<li><a href="/course/mycourse">내 강좌</a></li>
				</c:if>
				<c:if test="${grade eq '4'}">	
				<li><a href="/course/addcourse">강좌 추가</a></li>
				<li><a href="/course/addlecture">강의 추가</a></li>
				<li><a href="/course/selectmodifycourse/">강좌&강의 수정</a></li>
				<li><a href="/updateData">추천 데이터 업데이트</a></li>
				</c:if>
				
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->


