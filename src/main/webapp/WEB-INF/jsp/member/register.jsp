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

  <link href="resources/indexresource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   
  
  <!-- Font Awesome --><!--i class="fa fa-adress-card" 이부분 사용하는듯 , 개인 이모티콘사용시..-->
  <link href="resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"><!--리소스존재  -->
  
  <!-- Fancy Box -->
  <link href="resources/plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet"><!-- 로딩중인거 표시할때 쓰는듯..리소스존재 -->
  <link href="resources/plugins/jquery-nice-select/css/nice-select.css" rel="stylesheet"><!--셀럭터인데 안쓰인듯..리소스존재  -->
  <!-- <link href="resources/plugins/seiyria-bootstrap-slider/dist/css/bootstrap-slider.min.css" rel="stylesheet"> --><!--슬라이더 만들때 필요한듯 근데 no리소스.  -->

  <link href="resources/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="resources/css/member/login.css">
	<link rel="stylesheet" type="text/css" href="resources/plugins/slick-1.8.0/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="resources/plugins/slick-1.8.0/slick/slick-theme.css">


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>


	<script type ="text/javascript">
        $(document).ready(function() {

            var idBoolean=false;
            var nickBoolean = false;
            var emailBoolean =false;
            var passBoolean = false;

            // ID 유효성 및 중복검사
            $("#joinId").change(function() {

                var id = $("#joinId").val();
                regId = /^[가-힣a-zA-Z0-9]{5,20}$/; // 유효성
                // 검사.
                if (!regId.test(id)) {
                    $("#idFlag").text('한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요.');
                    $("#idFlag").css({color : "red"});
                    $('<i class="fa fa-times"></i>').prependTo('#idFlag');
                    $("#joinId").focus().val("");
                    $(".modal-header").text("아이디 형식 오류" );
                    $(".modal-body").text("한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요." );
                    $('#exampleModal').modal('show');

                    return;
                }
                $.ajax({
                    url : "dupleCheck.ajax",
                    type : "get",
                    data : "id="+id,
                    success : function(result) {

                        if(result=='true'){
                            $("#idFlag").text("[ "+id+" ]"+" "+'는 사용가능한 ID입니다.');
                            $("#idFlag").css({color : "green"});
                            $('<i class="fa fa-circle-o" id="idFlagIcon" ></i>').prependTo('#idFlag');
							$("#name").focus().val("");
                            idBoolean = true;
                        }
                        else {
                            $(".modal-header").text("ID 입력 실패" );
                            $(".modal-body").text("[ "+id+" ]"+" "+ "는 중복된 ID 입니다." );
                            $('#exampleModal').modal('show');

                            $("#idFlag").text("[ "+id+" ]"+" "+ "는 중복된 ID입니다.");
                            $("#idFlag").css({color : "red"});
                            $('<i class="fa fa-times"></i>').prependTo('#idFlag');
                            $("#joinId").focus().val("");
                            idBoolean=false;
                        }

                    },
                    error : function(x, y, z) {
                        alert("error" + z);
                    }
                });

            });

            // 닉네임 유효성 및 중복검사
            $("#nick").change(function() {
                var nick = $("#nick").val();
                regNick = /^[가-힣a-zA-Z0-9]{5,20}$/;
                // 검사.
                if (!regNick.test(nick)) {
                    $("#nickFlag").text('한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요.');
                    $("#nickFlag").css({color : "red"});
                    $('<i class="fa fa-times"></i>').prependTo('#nickFlag');
                    $("#nick").focus().val("");
                    $(".modal-header").text("닉네임 형식 오류" );
                    $(".modal-body").text("한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요." );
                    $('#exampleModal').modal('show');

                    return;
                }
                $.ajax({
                    url : "dupleCheck.ajax",
                    type : "get",
                    data : "nick=" + nick,
                    success : function(result){
                        if(result=='true'){
                            $("#nickFlag").text("[ "+nick+" ]"+" "+ "는 사용가능한 닉네임 입니다.");
                            $("#nickFlag").css({color : "green"});
                            $('<i class="fa fa-circle-o"></i>').prependTo('#nickFlag');
                            $("#email1").focus().val("");
                            nickBoolean = true;
                        }
                        else {
                            $(".modal-header").text("닉네임 중복 오류" );
                            $(".modal-body").text("[ "+nick+" ]"+" "+ "는 중복된 닉네임입니다.");
                            $('#exampleModal').modal('show');

                            $("#nickFlag").text("[ "+nick+" ]"+" "+ "는 중복된 닉네임입니다.");
                            $("#nickFlag").css({color : "red"});
                            $('<i class="fa fa-times"></i>').prependTo('#nickFlag');
                            $("#nick").focus().val("");
                            nickBoolean = false;
                        }
                    },
                    error : function(x, y, z) {
                        alert("error" + z);
                    }
                });
            });


            $("#email3").change(function(){
                var email3=$("#email3 option:selected").val(); //도메인 선택되면
                if(email3==0){
                    return;
                } else{
                    document.getElementById("email2").value=email3;
                    $("#email2").change(); //유효성검사
                }

            });

            // 이메일1 검사
            $("#email1").change(function() {
                var email1 = document.getElementById("email1").value;

                if (email1.length == 0) {
                    $(".modal-header").text("이메일 입력 오류" );
                    $(".modal-body").text("이메일이 비었습니다 입력해주세요.");
                    $('#exampleModal').modal('show');

                    $("#emailFlag").text(' 이메일이 비었습니다 입력해주세요.');
                    $("#emailFlag").css({color : "red"});
                    $('<i class="fa fa-times"></i>').prependTo('#emailFlag');
                    $("#email1").focus().val("");
                    return false;
                }

            });

            /* 이메일 유효성 검사 */
            $("#email2").change(function() {
                var email1 = document.getElementById("email1").value;
                var email2 = document.getElementById("email2").value;
                var regEmail = /^([a-zA-z]{3,20})\.([a-zA-z]{2,11})$/;//1:문자+숫자 ,2:소문자와 . 이 포함되어야함.
                aa = regEmail.test(email2); //문자열에 일치하는 패턴이 있는지 알고싶을때 true or false 반환.

                var $parent = $(this).parent();

                if (email1.length == 0|| email2.length == 0) {
                    $(".modal-header").text("이메일 입력 오류" );
                    $(".modal-body").text("이메일이 비었습니다 입력해주세요.");
                    $('#exampleModal').modal('show');

                    $("#emailFlag").text(' 이메일이 비었습니다 입력해주세요.');
                    $("#emailFlag").css({color : "red"});
                    $('<i class="fa fa-times"></i>').prependTo('#emailFlag');
                    $("#email1").focus().val("");
                    return false;
                }

                if (!regEmail.test(email2)) {
                    $(".modal-header").text("이메일 도메인 입력 오류" );
                    $(".modal-body").text("잘못된 형식입니다. 도메인부분은 소문자와 (.)로 입력해야 합니다.");
                    $('#exampleModal').modal('show');

                    $("#emailFlag").text('잘못된 형식입니다. 도메인부분은 소문자와 (.)을 입력해야 합니다.');
                    $("#emailFlag").css({color : "red"});
                    $('<i class="fa fa-times"></i>').prependTo('#emailFlag');
                    $("#email2").focus().val("");
                    return false;
                }


                $("#emailFlag").css({color : "green"});
                $("#emailFlag").text('');
                $('<i class="fa fa-circle-o"></i>').prependTo('#emailFlag');//동그라미 표시 emailflag에 덧붙인다.
                emailBoolean = true;
                $("#pass").focus().val("");

            });//이메일 인증 유효성 검사 끝.

			// 비밀번호 유효성 검사
            $("#pass").change(function() {
                regPass=/[0-9]/;
                var pass = $("#pass").val();
                if(regPass.test(pass)){ //regPass에 문자열이 있는지 판단할떄 true or false 리턴.입력값이 소문자가 존재하고..
					if(pass.length>=8&&pass.length<20){		//입력받은 문자열이 8이상 20미만일때
						$("#cpassFlag").text('비밀번호 확인을 하세요.');
						$("#cpass").focus().val("");
						$("#cpass").change(function(){
							var cpass = $("#cpass").val();
							if(pass==cpass){

								$("#cpassFlag").text("패스워드 입력이 성공적으로 이루어졌습니다.");
								$("#cpassFlag").css({color : "green"});
								$('<i class="fa fa-circle-o"></i>').prependTo('#cpassFlag');
								passBoolean = true;
							}
							else{
								$(".modal-header").text("비밀번호 확인 실패" );
								$(".modal-body").text("비밀번호 확인이 맞지 않습니다. 다시 입력해주세요.");
								$('#exampleModal').modal('show');

								$("#cpassFlag").text("비밀번호 확인이 맞지 않습니다. 다시 입력해주세요.");
								$("#cpass").focus().val("");
								passBoolean = false;
							}
						});

					}
					else{
						$(".modal-header").text("비밀번호 형식 오류" );
						$(".modal-body").text("잘못된 형식입니다. 비밀번호는 8~20자 로 만들어야 합니다.");
						$('#exampleModal').modal('show');

						$("#cpassFlag").text(' 잘못된 형식입니다. 비밀번호는 8~20자 로 만들어야 합니다.');
						$("#cpassFlag").css({color : "red"});
						$('<i class="fa fa-times"></i>').prependTo('#cpassFlag');
						$("#pass").focus().val("");
						return false;
					}

				}

            });//비밀번호 유효성 검사끝


			//조인폼 서브밋 클릭시 이벤트, 모바일 공백검사 후, 서비스 넘기기
            $("#btnJoinSubmit").click(function(){
                if(idBoolean){
					if(nickBoolean){
						if(emailBoolean){
							if(passBoolean){
								$(".modal-header").text(" 회원 가입 완료  " );
								$(".modal-body").text("회원가입이 정상적으로 처리되었습니다. 로그인해주세요.");
								$('#exampleModal').modal('show');


								document.joinC.action = "joinResult.mvc";
								document.joinC.submit();
							}
							else{
								$(".modal-header").text(" 필수 입력 요소 누락 " );
								$(".modal-body").text("비밀번호는 반드시 입력되어야 합니다.");
								$('#exampleModal').modal('show');
								return false;
							}
						}
						else{
							$(".modal-header").text(" 필수 입력 요소 누락 " );
							$(".modal-body").text("이메일 인증은 반드시 완료되어야 합니다.");
							$('#exampleModal').modal('show');
							return false;
						}
					}
					else{
						$(".modal-header").text(" 필수 입력 요소 누락 " );
						$(".modal-body").text("닉네임은 반드시 입력되어야 합니다.");
						$('#exampleModal').modal('show');
						return false;
					}
                }
                else{
                    $(".modal-header").text(" 필수 입력 요소 누락 " );
                    $(".modal-body").text("아이디는 반드시 입력되어야 합니다.");
                    $('#exampleModal').modal('show');
                    return false;
                }
            });
        });


	</script>
</head>
<body>
 
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>
					<span>회원 가입</span>
				</h3>
				<hr>
				<form class="form-horizontal" method="post" name="joinC" id="signup" action="joinResult"><!--액션추가  -->
					<div class="form-group">
						<label class="control-label col-sm-3">ID<span class="text-danger">*</span></label>
						<!-- id 입력부분 -->	
						<div class="col-md-7 col-sm-7">
							<div class="input-group">
								<input type="text" class="form-control" name="id" id="joinId" placeholder="한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요." value="${sessionScope.member.id }">
							</div>
							
							<div>	
								<p class="font-italic" id = "idFlag" style=" color:red;">
								<i class="fa fa-times"></i>&nbsp;&nbsp;</p>
							</div>
						</div>
					</div>

				
					<!-- 닉네임 입력부분  -->
					<div class="form-group" id="join2" style="">
						<label class="control-label col-sm-3">Nick Name<span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-9">
							<div class="input-group">
								<input type="text" class="form-control" name="nick"
								id="nick" placeholder="한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요." 
								value="${sessionScope.member.nick }">
							</div>
							<div>
								<p class="font-italic" id = "nickFlag" style=" color:red;">
								<i class="fa fa-times" ></i>&nbsp;&nbsp;</p>
							</div>
						</div>
					</div>
					
					<!-- 이메일 입력부분 -->
					<div class="form-group" id="join3" style="">
						<label class="control-label col-sm-3">Email<span
							class="text-danger">*</span></label>
						<div class="col-md-11 ">
							<div class="input-group">
								<input type="text" style="width:80px;"
									class="form-control" name="email1" id="email1" size="5"
									placeholder="Email ID" value="${session.member.email.split('@')[0]}"/>
									&nbsp; <b style="margin-top:5px;">@</b> &nbsp;
								<input type="text" style="width:80px;"
									class="form-control" name="email2" id="email2" size="5"
									placeholder="ABCDE.com etc.." value="${session.member.email.split('@')[1]}"/>
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
								<i class="fa fa-times"></i></p>
							</div>
						</div>
					</div>
						
					<!-- 패스워드 입력부분 -->	
					<div class="form-group" id="join4" style="">
						<label class="control-label col-sm-3">Set Password <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-8">
							<div class="input-group">
								<input type="password"
									class="form-control" name="pass" id="pass"
									placeholder="한글,특수문자(!,@),소문자,대문자조합  (8~20자) " value="">
							</div>
						</div>
					</div>
					
					<!-- 비밀번호 확인 -->
					<div class="form-group" id="join5" style="">
						<label class="control-label col-sm-3">Confirm Password <span
							class="text-danger">*</span></label>
						<div class="col-md-7 col-sm-8">
							<div class="input-group">
								<input type="password"
									class="form-control" name="cpass" id="cpass"
									placeholder="비밀번호 확인" value="">
							</div>
							<div>	
								<p class="font-italic" id = "cpassFlag" style=" color:red;margin-top:10px;">
								<i class="fa fa-times"></i>&nbsp;&nbsp; 비밀번호를 입력해주세요.</p>
							</div>
						</div>
					</div>

					<div class="form-group" id="join14" style="">
						<div class="col-xs-offset-3 col-xs-10">
							<input name="Submit" type="submit" value="회원가입" id="btnJoinSubmit" style="margin-top:10px;"
								class="btn btn-outline-success btn-lg btn-block"><!--btnJoinSumit이 이벤트발생 -->
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

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