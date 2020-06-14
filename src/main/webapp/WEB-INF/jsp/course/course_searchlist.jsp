<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>분야별 강좌</title>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
//페이지 이동 
function pagelist(page){
	var keyword = document.getElementById("hiddenkeyword").value;
	var searchOption = document.getElementById("hiddensearchOption").value;
	//페이지 맨위로
	window.scrollBy(0,0); 
	window.scrollTo(0,0);
	//ajax
	$.ajax({
		type : "get",
		url : "/course/searchajaxlist?keyword="+keyword+"&curPage="+page+"&searchOption="+searchOption,
		success : function(result) {
			$("#ajaxlist").html(result);
		}
	});
}
//키워드 검색
function searchlist() {
		var keyword = document.getElementById("ajaxkeyword").value;
		//페이지 맨위로
		window.scrollBy(0,0); 
		window.scrollTo(0,0);
		//ajax
		$.ajax({
			type : "get",
			url : "/course/searchajaxlist?keyword="+keyword,
			success : function(result) {
				$("#ajaxlist").html(result);
			}
		});
}
//카테고리 검색
function searchcategorylist(searchOption, category) {
		var keyword = document.getElementById("ajaxkeyword").value;
		//페이지 맨위로
		window.scrollBy(0,0); 
		window.scrollTo(0,0);
		//ajax
		$.ajax({
			type : "get",
			url : "/course/searchajaxlist?keyword="+category+"&searchOption="+searchOption,
			success : function(result) {
				$("#ajaxlist").html(result);
			}
		});
}

$(document).ready(function() {
	//기본화면 리스트 
	var keyword = document.getElementById("ajaxkeyword").value;
	$.ajax({
		type : "get",
		url : "/course/searchajaxlist?keyword="+keyword,
		success : function(result) {
			$("#ajaxlist").html(result);
		}
	});

	//키워드 엔터 검색시 함수 실행 
	 $("#ajaxkeyword").keypress(function (e) {
		 //13은 엔터키 
	        if (e.which == 13){
	                   searchlist();  
	        }
	    });
})

</script>
<style>
.menubar{
border:none;
border:0px;
margin:0px;
padding:0px;
font: 67.5% "나눔고딕";
font-size:20px;
font-weight:bold;
}

.menubar ul{
background: rgb(109,109,109);
height:50px;
list-style:none;
margin:0;
padding:0;
}

.menubar li{
float:left;
padding:0px;
}

.menubar li a{
background: rgb(109,109,109);
color:#cccccc;
display:block;
font-weight:normal;
line-height:50px;
margin:0px;
padding:0px 25px;
text-align:center;
text-decoration:none;
}

.menubar li a:hover, .menubar ul li:hover a{
background: rgb(71,71,71);
color:#FFFFFF;
text-decoration:none;
}

.menubar li ul{
background: rgb(109,109,109);
display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:200px;
z-index:200;
/*top:1em;
/*left:0;*/
}

.menubar li:hover ul{
display:block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}

.menubar li li {
background: rgb(109,109,109);
display:block;
float:none;
margin:0px;
padding:0px;
width:200px;
}

.menubar li:hover li a{
background:none;
}

.menubar li ul a{
display:block;
height:50px;
font-size:14px;
font-style:normal;
margin:0px;
padding:0px 10px 0px 15px;
text-align:left;
}

.menubar li ul a:hover, .menubar li ul li:hover a{
background: rgb(71,71,71);
border:0px;
color:#ffffff;
text-decoration:none;
}

.menubar p{
clear:left;
}


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
		<jsp:include page="/WEB-INF/jsp/fixedIndex/nav.jsp" />
		<jsp:include page="/WEB-INF/jsp/fixedIndex/toggleSidebar.jsp" />

		<br>
		<br>
		<jsp:include page="/WEB-INF/jsp/fixedIndex/menuButton.jsp" />
		<div class="container">
		<div class="menubar">
			<h3>분야별 강좌</h3>
			   <ul>
			      
			      <li><a href="javascript:searchcategorylist('coscategory1', '프로그래밍')" id="current">프로그래밍</a>
			         <ul>
			           <c:forEach var="procategory" items="${programmingcategory}">
			     		 <li><a href="javascript:searchcategorylist('coscategory2', '${procategory}')">${procategory}</a></li>
			      	   </c:forEach>
			         </ul>
			      </li>    
			      <li><a href="javascript:searchcategorylist('coscategory1', '디자인/CG')" id="current">디자인/CG</a>
			         <ul>
			           <c:forEach var="decategory" items="${designcategory}">
			     		 <li><a href="javascript:searchcategorylist('coscategory2', '${decategory}')">${decategory}</a></li>
			      		</c:forEach>
			         </ul>
			      </li>
			      <li><a href="javascript:searchcategorylist('coscategory1', 'IT비즈니스')" id="current">IT비즈니스</a>
			         <ul>
			           <c:forEach var="bucategory" items="${businesscategory}">
			     		 <li><a href="javascript:searchcategorylist('coscategory2', '${bucategory}')">${bucategory}</a></li>
			      		</c:forEach>
			         </ul>
			      </li>
			      
			   </ul>
			</div>
			<br><br><br>
			<!-- 코스 검색 -->						
			<div class="searchMenu">
		 	
				<input name="ajaxkeyword" id="ajaxkeyword" value="${ajaxkeyword}" placeholder="원하는 강좌를 입력해주세요!" style="width: 250px;">
				<button type="submit" class="btn" name="searchlist" onclick="javascript:searchlist()">검색</button>				
			
			</div>						
			<br><br><br>
					
			<div id="ajaxlist"></div>
		
		</div>
		<br>
		<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp"%>
	</div>
</body>
</html>