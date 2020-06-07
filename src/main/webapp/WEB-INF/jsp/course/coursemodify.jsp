<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${course.cosname} 코스 수정</title>
</head>
<script type="text/javascript">
/* 
카테고리 선택 - 특정 카테고리 선택시 input창에 카테고리선택 값 입력하고 readonly로 변경
			직접 입력시 input 값 비우고 readonly false로 변경 
 */
	function selectcoscategory1(value){
		var obj = document.getElementById("coscategory1");
		
			if(value=="0"){
					obj.value="";
					obj.readOnly=false;
					obj.focus();
				}
			else{
				obj.value=value;
				obj.readOnly=true;
				
				}
		}
	function selectcoscategory2(value){
		var obj = document.getElementById("coscategory2");
		
			if(value=="0"){
					obj.value="";
					obj.readOnly=false;
					obj.focus();
				}
			else{
				obj.value=value;
				obj.readOnly=true;
				
				}
		}

	
</script>
<body>
<div id="wrapper">
<jsp:include page="/WEB-INF/jsp/fixedIndex/nav.jsp"/>
<jsp:include page="/WEB-INF/jsp/fixedIndex/toggleSidebar.jsp"/>

<br><br>
<jsp:include page ="/WEB-INF/jsp/fixedIndex/menuButton.jsp"/>
<br><br><br>
<div class="container">


<form id="updatecourse" method="post" action="/course/updatecourse" enctype="multipart/form-data" method="${method}">
			<input type="hidden" name="cosno" value="${course.cosno}">
			<table>
				<tr>
					<td>코스 이름 </td>
					<td><input name="cosname" id="cosname" style="width: 500px;" value="${course.cosname}"></td>
				</tr>
				
				<tr>
					<td>코스내용 소개</td>
					<td><textarea name="cosintro" id="cosintro" style="width: 500px; height: 100px;">${course.cosintro}</textarea></td>
				</tr>
				
				<tr>
					<td>코스소개 영상</td>
					<td><textarea name="cosintrovideo" id="cosintrovideo" placeholder="유튜브 영상주소를 입력해주세요" style="width: 500px; height: 100px;">
					http://www.youtube.com/watch?v=${course.cosintrovideo}
					</textarea></td>
				</tr>
				
				<tr>
					<td>코스 대표 카테고리</td>
					<td>
						<select name="selectcategory1" id="selectcategory1" onChange="selectcoscategory1(this.value);">
							<c:forEach var="coscate1" items="${coursecategory1}">	
								<option value="${coscate1}">${coscate1}</option>
							</c:forEach>
							<option selected value="0">카테고리 직접 입력</option>
						</select>
						<br>
						<input name="coscategory1" id="coscategory1" style="width: 500px;" value="${course.coscategory1}"/>
					</td>
				</tr>
				<tr>
					<td>코스 상세 카테고리</td>
					<td>
						<select name="selectcategory2" id="selectcategory2" onChange="selectcoscategory2(this.value);">
							<c:forEach var="coscate2" items="${coursecategory2}">	
								<option value="${coscate2}">${coscate2}</option>
							</c:forEach>
							<option selected value="0">카테고리 직접 입력</option>
						</select>
						<br>
						<input name="coscategory2" id="coscategory2" style="width: 500px;" value="${course.coscategory2}"/>
					</td>
				</tr>
				<tr>
					<td>대표 이미지</td>
					<td><input type="file" name="file" id="file"></td>
				</tr>
				
				<tr>
					<td colspan="2">
					<input type="submit" class="btn btn-default"  value="코스 수정" /> 
					<button type="button" class="btn btn-default" onClick="location.href='/course/list'">코스 목록으로</button>
					<br>
					<button type="button" class="btn btn-default" onClick="location.href='/course/selectmodifylecture/${course.cosno}'">강의 수정하기</button>				
				</tr>
			</table>
		</form>
		</div>
		
		
	
<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp" %>
</div>
</body>
</html>