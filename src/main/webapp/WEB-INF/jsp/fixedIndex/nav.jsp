<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "sec" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- css도 같이 포함? -->
<!-- Bootstrap core CSS --> <!--toggle-->
  <link href="/resources/indexresource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">  
  <!-- Custom styles for this template -->
  <link href="/resources/indexresource/css/simple-sidebar.css" rel="stylesheet">
  <!-- Bootstrap core JavaScript -->
  <script src="/resources/indexresource/vendor/jquery/jquery.min.js"></script><!--toggle -->
  <script src="/resources/indexresource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

    function showGoogleLoginPopup(){
        window.open('https://accounts.google.com/o/oauth2/auth?client_id=508414677719-clrhg6p9fa4e1f8r3hgin0fpm7fd18il.apps.googleusercontent.com&response_type=code&scope=profile&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Flogin%2FgoogleSignInCallback', "구글로그인", "width=500, height=600, left=600, top=200");
    }

    function showGoogleKakaoPopup(){
        window.open('https://kauth.kakao.com/oauth/authorize?client_id=4c6dceb5eb1855fff0a634bdb04459aa&redirect_uri=http://localhost:8080/login/kakaoOauth&response_type=code', "카카오로그인", "width=500, height=600, left=600, top=200");
    }


   	function openLoginModal() {
    	$('#loginModal').show();
        $("#loginId").focus();


        // 입력 값 초기화
        $("#loginId").val('');
        $("#loginPW").val('');
        $('.modal-error').text('');
    }


	function closeLoginModal(){
		$('#loginModal').hide();
	}


	function checkLoginValidation() {

        var id = $("#loginId").val();
        var password = $("#loginPW").val();


        if(id.length <= 0){
            $('.modal-error').text(' 로그인 오류 : 아이디를 입력해주세요!');

            return false;
        }
        if(password.length<=0){
            $('.modal-error').text(' 로그인 오류 : 비밀번호를 입력해주세요!');

            return false;
        }

        return true;

    }

    function goLogin(){

        var id = $("#loginId").val();
        var password = $("#loginPW").val();

        if(checkLoginValidation() == true){

            $.ajax({
                url:"/loginProcess.ajax",
                type:"post",
                data:"id="+id+"&password="+password,
                dataType:"json",
                success:function(data){
                    if(data == true){
                        location.href="/";
                    }
                    else{
                        $('.modal-error').text(' 로그인 오류 : 입력하신 ID나 비밀번호가 맞지 않습니다.');
                        return false;
                    }
                },
                error:function(error){

                    $('.modal-error').text(' 로그인 오류 : 입력하신 ID나 비밀번호가 맞지 않습니다.');
                    return false;
                }
            });
		}
	}



    function enterKey(){
        if(window.event.keyCode==13){
            goLogin();
		}
	}



</script>

<sec:authorize access="isAuthenticated()">

	<sec:authentication property="principal.Username" var="memberId"/>

</sec:authorize>

	  <!-- Navigation -->
	  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container" >
		  <a class="navbar-brand" href="/">NoN</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
			  <li class="nav-item active">
				<a class="nav-link" href="/">Home
				  <span class="sr-only">(current)</span>
				</a>
			  </li>
				<sec:authorize access="isAnonymous()">
					<li class="nav-item">
						<a class="nav-link"  data-toggle="modal" href="#myModal" onclick="openLoginModal();">로그인</a>
					</li>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<li class="nav-item">
						<a class="nav-link" href="/memberUpdateForm">${memberId}</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/logout">logout</a>
					</li>
				</sec:authorize>
			  <li class="nav-item">
				<a class="nav-link" href="#">about</a>
			  </li>
			</ul>
		  </div>
		</div>
	  </nav>
  <!--Navigation-->

<!-- modal -->
<div class="modal" id="loginModal" role="dialog">
	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-error" style="color: #d43f3a;" align="center"></div>


			<div class="modal-header">
				<p>NoN 로그인</p>

				<button type="button" class="btn btn-join btn-md" data-dismiss="modal" onclick="closeLoginModal();">x</button>
			</div>
			<div class="modal-body" align="center" onkeyup="enterKey()">
				<input class="input-group-text" id="loginId" placeholder="아이디" style="width: 240px;">
				<br>
				<input class="input-group-text" type="password" id="loginPW" placeholder="비밀번호" style="width: 240px;">
				<br>
				<button type="submit" class="btn btn-info btn-md" data-dismiss="modal" onclick="goLogin();" style="width: 240px;" >로그인</button>

				<br><br>

				<p>
					비밀번호를 잊어버리셨나요? <a href="/resetPassword">비밀번호 초기화</a>
				</p>
				<p>
					회원이 아니신가요? <a href="/memberRegister">회원가입</a>
				</p>
			</div>


			<div class="modal-footer">

				<%--<button type="button" class="btn btn-info btn-md" data-dismiss="modal" onclick="showGoogleLoginPopup();">구글 로그인</button>--%>
				<%--<button type="button" class="btn btn-danger btn-md" data-dismiss="modal" onclick="showGoogleKakaoPopup();">카카오 로그인</button>--%>
			</div>
		</div>

	</div>
</div>
