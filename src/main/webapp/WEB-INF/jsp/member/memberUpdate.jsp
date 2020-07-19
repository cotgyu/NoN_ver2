<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>NoN 회원가입</title>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="resources/indexresource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<link href="resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">

<!-- Fancy Box -->
<link href="resources/plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
<link href="resources/plugins/jquery-nice-select/css/nice-select.css" rel="stylesheet">

<link href="resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/member/login.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/slick-1.8.0/slick/slick.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/slick-1.8.0/slick/slick-theme.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<script type ="text/javascript">
	$(document).ready(function() {


            $("#u_email3").change(function(){
                var email3 = $("#u_email3 option:selected").val(); //도메인 선택

				if(email3==0){
                    return;
                } else{
                    document.getElementById("u_email2").value=email3;
                }

            });
	}
	);

</script>

</head>

<body>
<div id="wrapper">
	<jsp:include page="/WEB-INF/jsp/fixedIndex/nav.jsp" />
	<br><br><br><br>

	<div class="container" style="width: 60%;">
		<div class="row">
			<div class="col-md-12">
				<h3>
					<span>NoN 회원 정보 수정</span>
				</h3>
				<hr>
				<form class="form-horizontal" method="post" name="updateC" action="memberUpdate" >

				
					<!-- 닉네임 입력부분  -->
					<div class="form-group">
						<label class="control-label col-sm-3">Nick <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-9">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-id-card" ></i></span>
								<input type="text" class="form-control" name="u_nick"
								id="u_nick" placeholder="한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요."
								value="${member.nickname}">
							</div>
							<div>
								<p class="font-italic" id = "u_nickFlag" style=" color:red;">
								</p>	
							</div>
						</div>
					</div>

					<!-- 이메일 입력부분 -->
					<div class="form-group">
						<label class="control-label col-sm-3">Email<span
							class="text-danger">*</span></label>
						<div class="col-md-11 ">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>
								<input type="text" style="width:80px;"
									class="form-control" name="u_email1" id="u_email1" size="5"
									placeholder="Email ID" value="${member.email.split('@')[0]}"/>
									&nbsp; <b style="margin-top:5px;">@</b> &nbsp;
								<input type="text" style="width:80px;"
									class="form-control" name="u_email2" id="u_email2" size="5"
									placeholder="ABCDE.com etc.." value="${member.email.split('@')[1]}"/>
									&nbsp; &nbsp;

								<select name="u_email3" id="u_email3" class="form-control" style="width:80px;">
									<option value="0" selected>Direct Input</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hotmail.com">hotmail.com</option>
								</select>

							</div>
							<div>
								<p class="font-italic" id = "u_emailFlag" style="color:red;margin-top:10px;">
								</p>
							</div>
						</div>
					</div>

					<br><br>


					<div class="form-group">
						<div class="col-xs-offset-3 col-xs-10">
							<input type="submit" value="회원 정보 수정" id="u_btnUpdateSubmit" style="margin-top:10px;"
								class="btn btn-outline-primary btn-lg btn-block">
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>


	<br><br><br><br><br>

	<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp" %>
</div>

</body>

</html>