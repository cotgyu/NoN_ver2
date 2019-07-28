<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>index page</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>edu pjt_3-Col </title>
 <!-- Bootstrap -->
  <!-- <link href="resources/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">안대는거 -->
  <link href="resources/indexresource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"><!--내꺼  -->
  
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
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

	<%@ include file="jsjs.jsp"%>
</head>

  
<body>
	<article id="login_arti">
	<div class="login-form-1">
		<form id="login-form" class="text-left" name="loginC" method="post"><!-- 로그인form으로.. -->
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="loginFormUserId" class="sr-only">User Id</label> <input
							type="text" class="form-control" id="loginFormUserId" name="id"
							placeholder="username">
					</div>
					<div class="form-group">
						<label for="loginFormUserPass" class="sr-only">Password</label> <input
							type="password" class="form-control" id="loginFormUserPass"
							name="pass" placeholder="password">
					</div>
					<div class="form-group login-group-checkbox">
						<label for="lg_remember">remember</label>
						<input type="checkbox" id="lg_remember" name="lg_remember"><!-- remember텍스트 눌러도 체크박스에 체크가능하게.. -->
					</div>
				</div>
				<button type="submit" class="login-button">
					<i class="fa fa-chevron-right"></i>
				</button>
			</div>
			<div class="etc-login-form">
				<p>
					forgot your password? <a href="forgotPasswordForm">click here</a>
				</p>
				<p>
					new user? <a href="register">create new account</a>
				</p>
			</div>
		</form>
		<a
			href="https://kauth.kakao.com/oauth/authorize?client_id=4c6dceb5eb1855fff0a634bdb04459aa&redirect_uri=http://localhost:8080/login/kakaoOauth&response_type=code">
			<img id="kakaoicon" src="resources/img/kakao.png" style="width: 50px; height: 50px">
		</a>
		<a
			href="${google_url}">
			<img id="googleicon" src="resources/img/googleLogin.png" style="width: 60px; height: 60px">
		</a>

	</div>
	</article>
	
	
	
	<!-- Modal -->
  <div class="modal" id="exampleModal" role="dialog">
    <div class="modal-dialog">
    
      Modal content
      <div class="modal-content">
        <div class="modal-header">
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger btn-md" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>