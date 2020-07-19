<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>새로운 코스 추가</title>
</head>
<script type="text/javascript">

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

	function insertvalidate(){
		if($("#cosname").val() == ''){
			alert('코스 이름을 입력해주세요!'); 
		  	return false;
		}else if($("#cosintro").val() == ''){
			alert('코스 내용 소개를 입력해주세요!'); 
		  	return false;
		}else if($("#cosintro").val() == ''){
			alert('코스 내용 소개를 입력해주세요!'); 
		  	return false;
		}else if($("#cosintrovideo").val() == ''){
			alert('대표 영상을 입력해주세요!'); 
		  	return false;
		}

		
		return true;
	}

	function insertCourse(){
		if(insertvalidate()){
		$("#addcourse").submit(); 
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


<form id="addcourse" method="post" action="/course/admin/insertcourse" enctype="multipart/form-data" method="${method}">
			<table>
				<tr>
					<td>코스 이름 </td>
					<td><input name="cosname" id="cosname" style="width: 500px;"></td>
				</tr>
				
				<tr>
					<td>코스내용 소개</td>
					<td><textarea name="cosintro" id="cosintro" style="width: 500px; height: 100px;"></textarea></td>
				</tr>
				
				<tr>
					<td>코스소개 영상</td>
					<td><textarea name="cosintrovideo" id="cosintrovideo" placeholder="유튜브 영상주소를 입력해주세요" style="width: 500px; height: 100px;"></textarea></td>
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
						<input name="coscategory1" id="coscategory1" style="width: 500px;" ></input>
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
						<input name="coscategory2" id="coscategory2" style="width: 500px;" ></input>
					</td>
				</tr>
				<tr>
					<td>대표 이미지</td>
					<td><input type="file" name="file" id="file"></td>
				</tr>
				
				<tr>
					<td colspan="2">
					
					<button type="button" class="btn btn-default" onClick="javascript:insertCourse();">코스 등록하기</button>
					<button type="button" class="btn btn-default" onClick="location.href='/course/list'">코스 목록으로</button>
				</tr>
			</table>
		</form>
		</div>
		
		
	
<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp" %>
</div>
</body>
</html>