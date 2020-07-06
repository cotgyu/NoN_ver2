<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>새로운 강의 추가</title>
<script type = "text/javascript">
	function insertvalidate(){
		if($("#lecname").val() == ''){
			alert('강의 이름을 입력해주세요!'); 
		  	return false;
		}else if($("#lectime").val() == ''){
			alert('강의 시간을 입력해주세요!'); 
		  	return false;
		}else if($("#lecvideo").val() == ''){
			alert('강의 영상를 입력해주세요!'); 
		  	return false;
		}
		return true;
	}

	function insertLecture(){
		if(insertvalidate()){
		$("#addlecture").submit(); 
		}
	}

</script>
</head>
<body>
<div id="wrapper">
<jsp:include page="/WEB-INF/jsp/fixedIndex/nav.jsp"/>
<jsp:include page="/WEB-INF/jsp/fixedIndex/toggleSidebar.jsp"/>

<br><br>
<jsp:include page ="/WEB-INF/jsp/fixedIndex/menuButton.jsp"/>
<br><br><br>
<div class="container">


<form id="addlecture" method="post" action="/course/admin/insertlecture" enctype="multipart/form-data" method="${method}">
			<table>
				<tr>
					<td>코스 번호 / 코스 이름</td>
					<td>
						<select name="cosno" id="cosno">
							<c:forEach var="coslist" items="${courselist}">	
								<option value="${coslist.cosno}">${coslist.cosno} / ${coslist.cosname}</option>	
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>강의 이름</td>
					<td><textarea name="lecname" id="lecname" style="width: 500px; height: 100px;"></textarea></td>
				</tr>
				
				<tr>
					<td>강의 시간</td>
					<td><textarea name="lectime" id="lectime" style="width: 500px; height: 100px;"></textarea></td>
				</tr>
				
				<tr>
					<td>강의 영상</td>
					<td><textarea name="lecvideo" id="lecvideo" placeholder="유튜브 영상주소를 입력해주세요" style="width: 500px; height: 100px;"></textarea></td>
				</tr>
				
				
				<tr>
					<td colspan="2">
					<button type="button" class="btn btn-default" onClick="javascript:insertLecture();">강의등록하기</button> 
					<button type="button" class="btn btn-default" onClick="location.href='/course/list'">코스 목록으로</button>
				</tr>
			</table>
		</form>
		</div>
<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp" %>
</div>
</body>
</html>