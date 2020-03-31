<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>NoN 비밀번호 초기화</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 <!-- Bootstrap -->
  <link href="resources/indexresource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">>
  
  <!-- Font Awesome -->
  <link href="resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">

  <!-- Fancy Box -->
  <link href="resources/plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
  <link href="resources/plugins/jquery-nice-select/css/nice-select.css" rel="stylesheet">
  <!-- <link href="resources/plugins/seiyria-bootstrap-slider/dist/css/bootstrap-slider.min.css" rel="stylesheet"> -->
  
  <!-- CUSTOM CSS -->
  <link href="resources/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="resources/css/member/login.css"> 
  
   <!-- member js -->
  <!-- <script src="resources/plugins/jquery/dist/jquery.js"></script> 없어-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  <!-- <script src="resources/js/LoginProcess.js"></script> -->
  	
	  
  
  <!-- 다음 이메일 -->
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
  
  <!-- 카카오 로그인 -->
  <!-- <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->

	<%@ include file="jsjs.jsp"%>
</head>
<body>

<div id="wrapper">
	<jsp:include page="/WEB-INF/jsp/fixedIndex/nav.jsp" />
	<br><br><br><br>

	<div class="container" style="width: 60%;">
			<div class="row">
				<div class="col-md-12">
					<h3>
						<span>NoN 비밀번호 찾기</span>
					</h3>
					<hr>
					<form class="form-horizontal" method="post" name="forgotPass" id="forgotPass" >


						<div class="form-group">
							<label class="control-label col-sm-3">ID<span class="text-danger">*</span></label>
							<!-- id 입력부분 -->
							<div class="col-md-7 col-sm-7">
								<div class="input-group">
									<input type="text"
										class="form-control" name="id" id="forgot_joinId"
										placeholder="아이디" value="">
								</div>

							</div>


						<!-- 이메일 입력부분 -->
						<div class="form-group">
							<label class="control-label col-sm-3">Email<span
								class="text-danger">*</span></label>
							<div class="col-md-11 ">
								<div class="input-group">
									<input type="text" style="width:80px;"
										class="form-control" name="email1" id="forgot_email1" size="5"
										placeholder="Email" value=""/>
										&nbsp; <b style="margin-top:5px;">@</b> &nbsp;
									<input type="text" style="width:80px;"
										class="form-control" name="email2" id="email2" size="5"
										placeholder="ABCDE.com etc.." value=""/>
										&nbsp; &nbsp;
									<select name="email3" id="email3" class="form-control" style="width:80px;">
										<option value="0" selected>Direct Input</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hotmail.com">hotmail.com</option>
									</select>
									&nbsp;&nbsp;&nbsp;

								</div>
								<div>
									<p class="font-italic" id = "emailFlag" style=" color:red;margin-top:10px;">
									<i class="fa fa-times"></i>&nbsp;&nbsp; 가입 시 입력한 이메일을 입력해주세요.</p>
								</div>
							</div>


							<input type="button" id="btnResetPassword" class="btn btn-outline-info" value="비밀번호 초기화 메일 발송"/>
						</div>




				</form>
			</div>
		</div>
	</div>
</div>


	<br><br><br><br><br>

	<%@ include file="/WEB-INF/jsp/fixedIndex/footer.jsp" %>
</div>

</body>
