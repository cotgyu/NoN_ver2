<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "sec" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!-- /#sidebar-wrapper -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="#"> 공백...(수정해야함..) </a></li>
				<li><a href="/course/list">분야별 강좌</a></li>
				<li><a href="#">질문과 답변</a></li>
				<sec:authorize access="isAuthenticated()">
					<li><a href="/course/myCourse">내 강좌</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="/course/admin/addcourse">강좌 추가</a></li>
					<li><a href="/course/admin/addlecture">강의 추가</a></li>
					<li><a href="/course/admin/selectmodifycourse/">강좌&강의 수정</a></li>
					<li><a href="/admin/updateData">추천 데이터 업데이트</a></li>
				</sec:authorize>
			</ul>
		</div>
<!-- /#sidebar-wrapper -->


