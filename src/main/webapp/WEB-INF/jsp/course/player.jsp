<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${course.cosname}_Player</title>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">

    $(document).ready(function() {

        var checkLectureInfo = new Object();

        checkLectureInfo.userId = '${sessionScope.member.id}';
        checkLectureInfo.cosno = ${course.cosno};

		// 체크한 강의 표시
        $.ajax({
            type : "post",
			data : JSON.stringify(checkLectureInfo),
            contentType: 'application/json',
            dataType: 'json',
            url : '/lecture/getCheckedLectureInfo',
            success : function(result) {

                if(result.errorMsg != undefined){
                    return;
                }

                var checkedLecture =  result.checkedList;

                for(var i in checkedLecture) {

                    $('#checklecture_'+checkedLecture[i]).prop("checked", true);
                }

            }
        });



    })

	// 강의 체크
	function checkedLecture(lecno) {
        var checkLectureInfo = new Object();

        checkLectureInfo.userId = '${sessionScope.member.id}';
        checkLectureInfo.cosno = ${course.cosno};
        checkLectureInfo.lecno = lecno;

        $.ajax({
            type : "post",
            data : JSON.stringify(checkLectureInfo),
            contentType: 'application/json',
            dataType: 'json',
            url : '/lecture/checkedLecture',
            success : function(result) {
                if(result.resultMessage == "error"){
                    alert("강좌를 체크하는데 오류가 발생하였습니다.");
                }

            }
        });
    }


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


<div id="wrapper" style="background-color: #495057">
<!-- 강의 목록 -->
	<div id="sidebar-wrapper"><!-- 사이드부분  공간 처리 할것 -->
			<ul class="sidebar-nav">
				<br>

				<c:forEach var="lec" items="${lecturelist}">
				<li>
					<a href="/course/player/${lec.cosno}/${lec.lecno}">${lec.lecname}
					&nbsp;
					<input type="checkbox" id="checklecture_${lec.lecno}" onchange="checkedLecture(${lec.lecno})"
					style=" width: 25px;
							height: 25px;
							border: 4px solid #bcbcbc;
							cursor: pointer;"/>
					</a>
				</li>
				
				</c:forEach>
			</ul>
	</div>

	<!-- Content menubutton-->
	<div id="page-content-wrapper">
		<div class="container-fluid">
			<a href="#lecture-toggle" class="btn btn-secondary" id="lecture-toggle">강좌리스트</a>
		</div>
	</div>
	<!-- Menu Toggle Script -->
	<script>
        $("#lecture-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
	</script>
			
<br>
<div class="container">

	<h2 style="color: #999999;">${course.cosname}</h2>
	<div>
		<button type="button" class="btn btn-default" onClick="location.href='/course/intro/${course.cosno}'">강좌로 돌아가기</button>
	</div>
	<br>

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