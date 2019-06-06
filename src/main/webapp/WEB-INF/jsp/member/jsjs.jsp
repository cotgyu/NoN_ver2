<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script>
/**
 * 
 */
$(document).ready(function() { 


	//로그인및 각종 버튼에 대한 자바스크립트 입니다.
	//로그인 버튼
	//$("#login-form").submit(function(event){ //id가 login-form인 form이 서브밋될때 실행되는 로직.
	//$("form").submit(function(){//이렇게 해도 form으로 넘어온다.
	$("#login-form").submit(function(event){
		console.log("test");
		id = $("#loginFormUserId").val();
		pass= $("#loginFormUserPass").val();
		if(id.length <= 0){
			$('.modal-header').text(' 로그인 오류 ');
			$('.modal-body').text('아이디를 입력해 주세요.');
			$('#exampleModal').modal('show');
			return false;
		}
		if(pass.length<=0){
			$('.modal-header').text(' 로그인 오류 ');
			$('.modal-body').text('비밀번호를 입력해 주세요.');
			$('#exampleModal').modal('show');
			return false;
		}
		console.log(id);
		console.log(pass);
		
		$.ajax({
			url:"forgotPass.ajax",
			type:"get",
			data:"id="+id+"&pass="+pass,
			//dataType:"json",
			success:function(data){
				if(data!=null){
					if(pass==data.pass){
						
						$('.modal-header').text(' 로그인 성공 ');
						$('.modal-body').text("[" + id + "]" + "님 환영합니다.");
						$('#exampleModal').modal('show');						
						//location.href="index.mvc";
						location.href="/";
					}
					else{
						$('.modal-header').text(' 로그인 오류 ');
						$('.modal-body').text('비밀번호가 일치하지 않습니다.');
						$('#exampleModal').modal('show');
						return false;
					}
				}
				else{
					$('.modal-header').text(' 로그인 오류 ');
					$('.modal-body').text('입력하신 ID가 존재하지 않습니다.');
					$('#exampleModal').modal('show');
					return false;
				}
			},
			error:function(xhr,status,error){
				alert("error :" + xhr.statusText + " ," + status + " ," + error);
			}
		});	
		
	 }); 
	
	//로그아웃 눌렀을때
	$("#loginFormLogout").click(function() {
		var result = confirm("로그아웃 하시겠습니까?");
		if (result) {
			return true;
		} 
		else {
			return false;
		}
	});
	
	
	//여기서부터 회원가입 폼 (JOINFORM 에 대한 자바스크립트 입니다.)	
	
	//빨간별표시 필수입력 요소중에 하나라도 빠지면 가입이 안되게하게끔 하는 flag
	var idBoolean=false;
	var nameBoolean = false;
	var nickBoolean = false;
	var emailBoolean =false;
	var passBoolean = false;
	var addressBoolean = false;
	var genderBoolean=false;
	var mobileBoolean = false;
	
	// ID 유효성 및 중복검사
	$("#joinId").change(function() {	//change function은 enter or 다른곳 클릭하면 실행.
		
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
			
			// console.log("잘못된 아이디 형식");
			return;
		}
		$.ajax({
			url : "dupleCheck.ajax",
			type : "get",
			data : "id=" + id, //서버에 요청시 보낼 파라미터 post방식
			//data : id,
			success : function(map) { //map을 반환값으로..
				console.log(map); //result:true 반환됨
				//console.log("여기서 에러"+responseData);
				//var obj = eval("("+ responseData+ ")"); //json text를 json object로 변환.
				
				console.log(Object.keys(map));
				var m = Object.values(map); //map={result,true or false}
				
				//if (obj.message == 'success') {
				if(m=='true'){	
					$("#idFlag").text("[ "+id+" ]"+" "+'는 사용가능한 ID입니다.');
					$("#idFlag").css({color : "green"});
					$('<i class="fa fa-circle-o" id="idFlagIcon" ></i>').prependTo('#idFlag');
					idBoolean = true;
					$("#name").focus().val("");
				} 
				else {
					$(".modal-header").text("ID 입력 실패" );
					$(".modal-body").text("[ "+id+" ]"+" "+ "는 중복된 ID 입니다." );
					$('#exampleModal').modal('show');
					/*alert("[ "+id+" ]"+" "+ "is Duplicate ID");*/
					
					$("#idFlag").text("[ "+id+" ]"+" "+ "는 중복된 ID입니다.");
					$("#idFlag").css({color : "red"});
					$('<i class="fa fa-times"></i>').prependTo('#idFlag');
					$("#joinId").focus().val("");
					idBoolean=false;
				}
				// console.log("돌아온 값 :
				// " + obj.id + ", " +
				// this);
			},
			error : function(x, y, z) {
					alert("안되네요..." + z);
			}
		});

	});
	
	// 이름 유효성검사
	$("#name").change(function() {
		var name = $("#name").val();
		if (name.length >= 2) {
			$("#nameFlag").text('이름 입력 완료.');
			$("#nameFlag").css({color : "green"});
			$('<i class="fa fa-circle-o"></i>').prependTo('#nameFlag');
			nameBoolean = true;
			$("#nick").focus().val("");
		} 
		else {
			$(".modal-header").text("이름 형식 오류" );
			$(".modal-body").text("2자이상 이름을 입력해주세요." );
			$('#exampleModal').modal('show');
			
			$("#nameFlag").text('2자이상 이름을 입력해주세요.');
			$("#nameFlag").css({color : "red"});
			$('<i class="fa fa-times"></i>').prependTo('#nameFlag');
			$("#name").focus().val("");
			nameBoolean=false;
		}
	});
	
	// 닉네임 유효성 및 중복검사
	$("#nick").change(function() {
		var nick = $("#nick").val();
		regNick = /^[가-힣a-zA-Z0-9]{5,20}$/; // 유효성
		// 검사.
		if (!regNick.test(nick)) {
			$("#nickFlag").text('한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요.');
			$("#nickFlag").css({color : "red"});
			$('<i class="fa fa-times"></i>').prependTo('#nickFlag');
			$("#nick").focus().val("");
			$(".modal-header").text("닉네임 형식 오류" );
			$(".modal-body").text("한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요." );
			$('#exampleModal').modal('show');
			
			// console.log("잘못된 아이디 형식");
			return;
		}
		
		console.log("nick = " + nick);
		$.ajax({
			url : "dupleCheck.ajax",
			type : "get",
			data : "nick=" + nick,   
			//success : function(responseData) { //리턴값
			success : function(map){
				//var obj = eval("("+ responseData+ ")");
				//console.log("obj"+ obj);
				//if (obj.message == 'success') {
				var m = Object.values(map);//map의 값을 m에다 저장.
				if(m=='true'){
					$("#nickFlag").text("[ "+nick+" ]"+" "+ "는 사용가능한 닉네임 입니다.");
					$("#nickFlag").css({color : "green"});
					$('<i class="fa fa-circle-o"></i>').prependTo('#nickFlag');
					nickBoolean = true;
					$("#email1").focus().val("");
					
				} 
				else {
					$(".modal-header").text("닉네임 중복 오류" );
					$(".modal-body").text("[ "+nick+" ]"+" "+ "는 중복된 닉네임입니다.");
					$('#exampleModal').modal('show');
					
					$("#nickFlag").text("[ "+nick+" ]"+" "+ "는 중복된 닉네임입니다.");
					$("#nickFlag").css({color : "red"});
					$('<i class="fa fa-times"></i>').prependTo('#nickFlag');
					$("#nick").focus().val("");
				}
			},
			error : function(x, y, z) {
				alert("안되네요..." + z);
			}
		});
	});
/* }); */
//==================================
// 이메일 3 도메인 변경될때(셀렉트박스)
$("#email3").change(function(){ 
	var email3=$("#email3 option:selected").val(); //도메인 선택되면
	if(email3==0){ 
		return; 
	} else{
	document.getElementById("email2").value=email3; //email2에 삽입
	}
 
});

/* 이메일 인증 및 유효성 검사 */
$("#btnEmailCode").click(function() {
	var email1 = document.getElementById("email1").value;
	var email2 = document.getElementById("email2").value;
	var regEmail = /^([a-zA-z]{3,20})\.([a-zA-z]{2,11})$/;//1:문자+숫자 ,2:소문자와 . 이 포함되어야함.
	aa = regEmail.test(email2); //문자열에 일치하는 패턴이 있는지 알고싶을때 true or false 반환. 
	console.log(email1 + "," + email2);
	
	var $parent = $(this).parent();//????
	
	if (email1.length == 0|| email2.length == 0) {//입력란 둘다 비어있으면..
		$(".modal-header").text("이메일 입력 오류" );
		$(".modal-body").text("이메일이 비었습니다 입력해주세요.");
		$('#exampleModal').modal('show');//부트스트랩 모달부분 지금 적용안된듯.
		
		$("#emailFlag").text(' 이메일이 비었습니다 입력해주세요.');
		$("#emailFlag").css({color : "red"});
		$('<i class="fa fa-times"></i>').prependTo('#emailFlag');
		$("#email1").focus().val("");
		return false;
	} 
	console.log(aa);
	if (!regEmail.test(email2)) {//두번째 란에 입력이 제대로 안되면....
		$(".modal-header").text("이메일 도메인 입력 오류" );
		$(".modal-body").text("잘못된 형식입니다. 도메인부분은 소문자와 (.)로 입력해야 합니다.");
		$('#exampleModal').modal('show');
					
		$("#emailFlag").text('잘못된 형식입니다. 도메인부분은 소문자와 (.)을 입력해야 합니다.');
		$("#emailFlag").css({color : "red"});
		$('<i class="fa fa-times"></i>').prependTo('#emailFlag');
		$("#email2").focus().val("");
		return false;
	}
	$("#emailFlag").text("[ "+email1 + " @ " + email2+" ]"+ '로 이메일 인증이 진행중입니다.');//정상적으로 입력시 이쪽으로...
	$("#btnEmailCode").prop('disabled',true);//이메일 인증버튼누르면....버튼 비활성화시킨다.
	$.ajax({
		url:"emailCheck.ajax",
		type:"get",
		data:"email1="+email1+"&email2="+email2,
		//success:function(responseData){
		success:function(map){
			//var obj = eval("("+ responseData+ ")");
			var authNum = Object.values(map); //리턴받은 map의 value값 추출
			//var authNum=obj.authNum;
			console.log("authNum값 "+authNum);
			
			$parent.append('<input type="text" style="width:150px;" class="form-control" name="authNum" id="authNum" size="5" placeholder="인증번호 입력"/>');//인증번호 입력란
			//.prependTo('#btnEmailCode');
			$('<input type="button" id="btnauthNum" class="btn btn-outline-info" value="인증번호 확인"/>').appendTo($parent);//인증번호 입력버튼
			
			$("#btnauthNum").click(function(){ //인증번호 입력버튼 클릭하면....
				//console.log("#authNum");
				user_authNum=$("#authNum").val(); //document.getElementById("authNum").value;
				if(authNum==user_authNum){ //사용자가 입력한 인증번호가 일치하면 
					$("#authNum").remove();//인증번호 입력란 사라진다.
					$("#btnauthNum").remove();//인증번호 입력버튼 사라진다.
					$("#btnEmailCode").val('Complete');//이메일 인증버튼이 Complete로 바뀜...
					var e1 = document.getElementById("email1");
					var e2 = document.getElementById("email2");
					var e3 = document.getElementById("email3");
					e1.readOnly =true;//수정못하게...
					e1.style.backgroundColor="#dcdcdc";//그레이색깔
					e2.readOnly =true;
					e2.style.backgroundColor="#dcdcdc";
					e3.readOnly =true;
					e3.style.backgroundColor="#dcdcdc";
					$("#btnEmailCode").prop('disabled',true);//이메일 인증버튼 비활성화
					$("#emailFlag").text("[ "+email1 + " @ " + email2+" ]"+ '의 이메일인증이 완료되었습니다.');
					$("#emailFlag").css({color : "green"});
					$('<i class="fa fa-circle-o"></i>').prependTo('#emailFlag');//동그라미 표시 emailflag에 덧붙인다.
					emailBoolean = true; //form의 모든값이 필수므로 불리언 체크.
					$("#pass").focus().val("");
				}
				else{ //인증번호 입력 실패시....
					$(".modal-header").text("이메일 인증 실패" );
					$(".modal-body").text("이메일 인증이 실패하였습니다. 입력하신 이메일을 확인해보세요.");
					$('#exampleModal').modal('show');
					
					$("#emailFlag").text("[ "+user_authNum +" ]"+ '이메일 인증이 실패하였습니다.');
					$("#authNum").focus().val("");
					//return false;
					emailBoolean=false;
				}
			});
		},//success 끝
		error:function(xhr,status,error){
		alert("error :" + xhr.statusText + " ," + status + " ," + error);
		}
	});//ajax 끝
});//이메일 인증 유효성 검사 끝.

// 비밀번호 유효성 검사
$("#pass").change(function() {
	regPass=/[a-z]/;
	regPass1=/[A-Z]/;
	regPass2=/[0-9]/;
	regPass3=/[!@]/;
	var pass = $("#pass").val();
	if(regPass.test(pass)){ //regPass에 문자열이 있는지 판단할떄 true or false 리턴.입력값이 소문자가 존재하고..
	   if(regPass1.test(pass)){//대문자가 존재하고
	      if(regPass2.test(pass)){//숫자가 존재하고
	        if(regPass3.test(pass)){//특수문자가 존재하고
	        	if(pass.length>=8&&pass.length<20){		//입력받은 문자열이 8이상 20미만일때 
	        		$("#cpassFlag").text('비밀번호 확인을 하세요.');
	    			$("#cpass").focus().val("");
	    			$("#cpass").change(function(){
	    				var cpass = $("#cpass").val();
	    				if(pass==cpass){
	    					console.log(pass);	
	    					console.log(cpass);	
	    				
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
	    					//return false;
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
	        else{
	        	$(".modal-header").text("비밀번호 형식 오류" );
				$(".modal-body").text("잘못된 형식입니다. 비밀번호에는 반드시 특수문자가 들어가야 합니다.");
				$('#exampleModal').modal('show');
				
	        	
		    	 $("#cpassFlag").text(' 잘못된 형식입니다.반드시 특수문자가 들어가야 합니다.');
				 $("#cpassFlag").css({color : "red"});
				 $('<i class="fa fa-times"></i>').prependTo('#cpassFlag');
				 $("#pass").focus().val("");
				 return false;
	        }

	     }
	     else{
	    	 $(".modal-header").text("비밀번호 형식 오류" );
			 $(".modal-body").text("잘못된 형식입니다. 비밀번호에는 반드시 숫자가 들어가야 합니다.");
			 $('#exampleModal').modal('show');
				
	    	 $("#cpassFlag").text(' 잘못된 형식입니다.반드시 숫자가 들어가야 합니다. ');
			 $("#cpassFlag").css({color : "red"});
			 $('<i class="fa fa-times"></i>').prependTo('#cpassFlag');
			 $("#pass").focus().val("");
			 return false;
	     }

	  }
	  else{
		  $(".modal-header").text("비밀번호 형식 오류" );
		  $(".modal-body").text("잘못된 형식입니다. 비밀번호에는 반드시 대문자가 들어가야 합니다.");
		  $('#exampleModal').modal('show');
			 
	   
	    $("#cpassFlag").text(' 잘못된 형식입니다.반드시 대문자가 들어가야 합니다. ');
		$("#cpassFlag").css({color : "red"});
		$('<i class="fa fa-times"></i>').prependTo('#cpassFlag');
		$("#pass").focus().val("");
		return false;
	  }

  }
  else{
	  $(".modal-header").text("비밀번호 형식 오류" );
	  $(".modal-body").text("잘못된 형식입니다. 비밀번호에는 반드시 소문자가 들어가야 합니다.");
      $('#exampleModal').modal('show');
	  
	
	$("#cpassFlag").text(' 잘못된 형식입니다.반드시 소문자가 들어가야 합니다.');
	$("#cpassFlag").css({color : "red"});
	$('<i class="fa fa-times"></i>').prependTo('#cpassFlag');
	$("#pass").focus().val("");
	return false;
   }
});//비밀번호 유효성 검사끝

//다음 주소 찾기 api 불러오기 및 생년월일 셀렉트박스 값 채워졌는지 체크
$("#btnZipcode").click(findZipCode);

//zipCode실행해서 zipCode와 address1이 채워졌는지 체크 adress2가 비었는지 체크
$("#address2").click(function(){
	address1 = $("#address1").val();
	zipCode = $("#zipCode").val();
	
	if(address1==null||zipCode==null||address1==""||zipCode==""){
		$(".modal-header").text(" 주소 검색 " );
		 $(".modal-body").text("우편번호 찾기 버튼을 먼저 눌러주세요.");
		 $('#exampleModal').modal('show');
		 
		
		$("#addressFlag").text('우편번호 찾기 버튼을 먼저 눌러주세요.');
		$("#addressFlag").css({color : "red"});
		$('<i class="fa fa-times"></i>').prependTo('#addressFlag');
		$("btnZipcode").focus().val("");
		return false;
	}
	else{
		$("#address2").change(function(){
			address2 = $("#address2").val();
			if(address2.length>0){
				$("#addressFlag").text("주소입력이 성공적으로 이루어졌습니다.");
				$("#addressFlag").css({color : "green"});
				$('<i class="fa fa-circle-o"></i>').prependTo('#addressFlag');
				addressBoolean = true;
				console.log("주소입력완료");
			}
			else{
				$(".modal-header").text(" 주소 검색 " );
				 $(".modal-body").text("상세주소를 입력해주세요.");
				 $('#exampleModal').modal('show');
				 
				
				$("#addressFlag").text('상세주소를 입력해주세요.');
				$("#addressFlag").css({color : "red"});
				$('<i class="fa fa-times"></i>').prependTo('#addressFlag');
				$("address2").focus().val("");
				//return false;
				addressBoolean=false;
			}
		});
	}
});

//모바일 셀렉트상자에 접근하는 순간 gender 와 infoEmailget 에 체크를 했는지 체크
$("#mobile1").click(function(){
	console.log("mobile1들어왓나");
	var gender = $('input[name=gender]:checked').val(); 
	//var emailGet=$('input:radio[name=emailGet]:checked').val();
	var emailGet=$('input[name=emailGet]:checked').val();
	console.log(gender+" , "+emailGet);
	if(gender!=undefined&&emailGet!=undefined){
		genderBoolean=true;
		//return;
		
	}
	else{
		$(".modal-header").text(" 필수 입력 요소  " );
		 $(".modal-body").text("성별과 정보이메일 수신여부를 먼저 체크해주세요.");
		 $('#exampleModal').modal('show');
		 
		 genderBoolean=false;
	}
});

//조인폼 서브밋 클릭시 이벤트, 모바일 공백검사 후, 서비스 넘기기
$("#btnJoinSubmit").click(function(){
	mobile1 = $("#mobile1").val();
	mobile2 = $("#mobile2").val();
	mobile3 = $("#mobile3").val();
	
	if(mobile1!=null&&mobile2!=null&&mobile3!=null){
		mobileBoolean = true;
	}
	else{
		$(".modal-header").text(" 필수 입력 요소  " );
		 $(".modal-body").text("모바일은 반드시 입력되어야 합니다.");
		 $('#exampleModal').modal('show');
		 
		mobileBoolean = false;
	}

	if(idBoolean){
		if(nameBoolean){
			if(nickBoolean){
				if(emailBoolean){
					if(passBoolean){
						if(addressBoolean){
							if(genderBoolean){
								if(mobileBoolean){
									$(".modal-header").text(" 회원 가입 완료  " );
									 $(".modal-body").text("회원가입이 정상적으로 처리되었습니다. 로그인해주세요.");
									 $('#exampleModal').modal('show');
									 
									
									document.joinC.action = "joinResult.mvc";
									document.joinC.submit();
								}
								else{
									$(".modal-header").text(" 필수 입력 요소 누락 " );
									 $(".modal-body").text("모바일은 반드시 입력되어야 합니다.");
									 $('#exampleModal').modal('show');
									 
									return false;
								}
							}
							else{
								$(".modal-header").text(" 필수 입력 요소 누락 " );
								 $(".modal-body").text("성별은 반드시 입력되어야 합니다.");
								 $('#exampleModal').modal('show');
								 
								return false;
							}
						}
						else{
							$(".modal-header").text(" 필수 입력 요소 누락 " );
							 $(".modal-body").text("주소는 반드시 입력되어야 합니다.");
							 $('#exampleModal').modal('show');
							return false;
						}
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
			 $(".modal-body").text("이름은 반드시 입력되어야 합니다.");
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
//=======회원가입 완료============================================




//여기서부터는 회원정보 수정에 대한 자바스크립트 입니다.

//빨간별표시 필수입력 요소중에 하나라도 빠지면 가입이 안되게하게끔 하는 flag

// 이름 유효성검사
$("#u_name").change(function() {
	var name = $("#u_name").val();
	if (name.length >= 2) {
		$("#u_nameFlag").text('이름 등록이 완료되었습니다.');
		$("#u_nameFlag").css({color : "green"});
		$('<i class="fa fa-circle-o"></i>').prependTo('#u_nameFlag');
		nameBoolean = true;
		$("#u_nick").focus().val("");
	} 
	else {
		$(".modal-header").text(" 회원 정보 수정 이름 " );
		 $(".modal-body").text("최소 2자이상 입력해주세요.");
		 $('#exampleModal').modal('show');
		 
		$("#u_nameFlag").text('최소 2자이상 입력해주세요.');
		$("#u_nameFlag").css({color : "red"});
		$('<i class="fa fa-times"></i>').prependTo('#u_nameFlag');
		$("#u_name").focus().val("");
	}
});

// 닉네임 유효성 및 중복검사
$("#u_nick").change(function() {
	var nick = $("#u_nick").val();
	regNick = /^[가-힣a-zA-Z0-9]{5,20}$/; // 유효성
	// 검사.
	if (!regNick.test(nick)) {
		$("#u_nickFlag").text(' 한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요.');
		$("#u_nickFlag").css({color : "red"});
		$('<i class="fa fa-times"></i>').prependTo('#u_nickFlag');
		$("#u_nick").focus().val("");
		$(".modal-header").text(" 회원 정보 수정 닉네임 " );
		 $(".modal-body").text("잘못된 형식입니다. 한글,영어,숫자를 이용해서 5~20자 이내로 입력하세요.");
		 $('#exampleModal').modal('show');
		
		// console.log("잘못된 아이디 형식");
		return false;
	}
	
	console.log("nick = " + nick);
	$.ajax({
		url : "dupleCheck.ajax",
		type : "get",
		data : "nick=" + nick,
		success : function(responseData) {
			var obj = eval("("+ responseData+ ")");
			console.log("obj"+ obj);
			if (obj.message == 'success') {
				$("#u_nickFlag").text("[ "+nick+" ]"+" "+ "is Available NICK");
				$("#u_nickFlag").css({color : "green"});
				$('<i class="fa fa-circle-o"></i>').prependTo('#u_nickFlag');
				var nickBoolean = true;
				$("#u_email1").focus().val("");
				
			} 
			else {
				$(".modal-header").text(" 회원 정보 수정 닉네임 " );
				 $(".modal-body").text("[ "+nick+" ]"+" "+ "는 중복된 닉네임입니다.");
				 $('#exampleModal').modal('show');
				 
				$("#u_nickFlag").text("[ "+nick+" ]"+" "+ "는 중복된 닉네임입니다.");
				$("#u_nickFlag").css({color : "red"});
				$('<i class="fa fa-times"></i>').prependTo('#u_nickFlag');
				$("#u_nick").focus().val("");
			}
		},
		error:function(xhr,status,error){
			alert("error :" + xhr.statusText + " ," + status + " ," + error);
		}
	});
});

// 이메일 3 도메인 변경될때(셀렉트박스)
$("#u_email3").change(function(){ 
	var email3=$("#u_email3 option:selected").val();
	if(email3==0){ 
		return false; 
	} else{
	document.getElementById("u_email2").value=email3; 
	}
 
});

/* 이메일 인증 및 유효성 검사 */
$("#u_btnEmailCode").click(function() {
	var email1 = document.getElementById("u_email1").value;
	var email2 = document.getElementById("u_email2").value;
	var regEmail = /^([a-zA-z]{3,20})\.([a-zA-z]{2,11})$/;
	aa = regEmail.test(email2)
	console.log(email1 + "," + email2);
	
	var $parent = $(this).parent();
	
	if (email1.length == 0|| email2.length == 0) {
		$(".modal-header").text(" 회원 정보 수정 이메일 " );
		 $(".modal-body").text("이메일창이 비었습니다. 이메일을 입력해주세요.");
		 $('#exampleModal').modal('show');
		 
		$("#u_emailFlag").text('이메일창이 비었습니다. 이메일을 입력해주세요.');
		$("#u_emailFlag").css({color : "red"});
		$('<i class="fa fa-times"></i>').prependTo('#u_emailFlag');
		$("#u_email1").focus().val("");
		return false;
	} 
	console.log(aa);
	if (!regEmail.test(email2)) {
		$(".modal-header").text(" 회원 정보 수정 도메인 " );
		 $(".modal-body").text(" 잘못된 형식입니다. 도메인부분은 소문자와 (.)을 포함해야 합니다.");
		 $('#exampleModal').modal('show');
		 
		$("#u_emailFlag").text(' 잘못된 형식입니다. 도메인부분은 소문자와 (.)을 포함해야 합니다.');
		$("#u_emailFlag").css({color : "red"});
		$('<i class="fa fa-times"></i>').prependTo('#u_emailFlag');
		$("#u_email2").focus().val("");
		return false;
	}
	$("#u_emailFlag").text("[ "+email1 + " @ " + email2+" ]"+ '입력하신 이메일로 인증번호가 발송되었습니다.');
	$("#u_btnEmailCode").prop('disabled',true);
	$.ajax({
		url:"emailCheck.ajax",
		type:"get",
		data:"email1="+email1+"&email2="+email2,
		success:function(responseData){
			$("#emailFlag").text("[ "+email1 + " @ " + email2+" ]"+ '이메일 인증이 진행중입니다. 잠시만 기다려주세요.');
			var obj = eval("("+ responseData+ ")");
			var authNum=obj.authNum;
			console.log("여기는 오는가???? authNum : " + authNum);
			$parent.append('<input type="text" style="width:80px;" class="form-control" name="u_authNum" id="u_authNum" size="5" placeholder="Check Your Email"/>');
			//.prependTo('#btnEmailCode');
			$('<input type="button" id="u_btnauthNum" class="btn btn-outline-info" value="인증번호 확인"/>')
			.appendTo($parent);
			
			$("#u_btnauthNum").click(function(){
				console.log("#u_authNum");
				user_authNum=$("#u_authNum").val(); //document.getElementById("authNum").value;
				if(authNum==user_authNum){
					$("#u_authNum").remove();
					$("#u_btnauthNum").remove();
					$("#u_btnEmailCode").val('Complete');
					var e1 = document.getElementById("u_email1");
					var e2 = document.getElementById("u_email2");
					var e3 = document.getElementById("u_email3");
					e1.readOnly =true;
					e1.style.backgroundColor="#dcdcdc";
					e2.readOnly =true;
					e2.style.backgroundColor="#dcdcdc";
					e3.readOnly =true;
					e3.style.backgroundColor="#dcdcdc";
					$("#u_btnEmailCode").prop('disabled',true);
					$("#u_emailFlag").text("[ "+email1 + " @ " + email2+" ]"+ ' 이메일 인증이 완료되었습니다.');
					$("#u_emailFlag").css({color : "green"});
					$('<i class="fa fa-circle-o"></i>').prependTo('#u_emailFlag');
					emailBoolean = true;
					$("#u_pass").focus().val("");
				}
				else{
					$(".modal-header").text(" 회원 정보 수정 이메일 인증 실패 " );
					 $(".modal-body").text(" 인증번호가 유효하지 않습니다. 당신의 이메일을 확인해보세요.");
					 $('#exampleModal').modal('show');
					 
					$("#u_emailFlag").text("[ "+user_authNum +" ]"+ '이메일 인증 실패');
					$("#u_authNum").focus().val("");
				}
			});
		},//success 끝
		error:function(xhr,status,error){
		alert("error :" + xhr.statusText + " ," + status + " ," + error);
		}
	});//ajax 끝
});


//다음 주소 찾기 api 불러오기 및 생년월일 셀렉트박스 값 채워졌는지 체크
$("#u_btnZipcode").click(u_findZipCode);

//zipCode실행해서 zipCode와 address1이 채워졌는지 체크 adress2가 비었는지 체크
$("#u_address2").click(function(){
	address1 = $("u_#address1").val();
	zipCode = $("u_#zipCode").val();
	
	if(address1==null||zipCode==null||address1==""||zipCode==""){
		$(".modal-header").text(" 회원 정보 수정 주소 " );
		 $(".modal-body").text(" 우편번호 찾기 버튼을 먼저 눌러주세요.");
		 $('#exampleModal').modal('show');
		 
		$("#u_addressFlag").text('우편번호 찾기 버튼을 먼저 눌러주세요.');
		$("#u_addressFlag").css({color : "red"});
		$('<i class="fa fa-times"></i>').prependTo('#u_addressFlag');
		$("u_btnZipcode").focus().val("");
		return false;
	}
	else{
		$("#u_address2").change(function(){
			address2 = $("#address2").val();
			if(address2.length>0){
				$("#u_addressFlag").text("주소가 성공적으로 입력되었습니다.");
				$("#u_addressFlag").css({color : "green"});
				$('<i class="fa fa-circle-o"></i>').prependTo('#u_addressFlag');
				addressBoolean = true;
			}
			else{
				$(".modal-header").text(" 회원 정보 수정 주소 " );
				 $(".modal-body").text(" 상세주소를 입력해주세요.");
				 $('#exampleModal').modal('show');
				 
				$("#u_addressFlag").text('상세주소를 입력해주세요.');
				$("#u_addressFlag").css({color : "red"});
				$('<i class="fa fa-times"></i>').prependTo('#u_addressFlag');
				$("#u_address2").focus().val("");
				return false;
			}
		});
	}
});

//모바일 셀렉트상자에 접근하는 순간 gender 와 infoEmailget 에 체크를 했는지 체크
$("#u_mobile1").click(function(){
	gender = $('input:radio[name=u_gender]:checked').val(); 
	emailGet=$('input:radio[name=u_emailGet]:checked').val();
	console.log(gender+" , "+emailGet);
	if(gender!=undefined&&emailGet!=undefined){
		genderBoolean=true;
		return;
	}
	else{
		$(".modal-header").text(" 회원 정보 수정 성별 " );
		 $(".modal-body").text(" 성별을 입력해주세요.");
		 $('#exampleModal').modal('show');
		return false;
	}
});

//조인폼 서브밋 클릭시 이벤트, 모바일 공백검사 후, 서비스 넘기기
$("#u_btnUpdateSubmit").click(function(){
	console.log("여기는 들어오는가");
	if($("u_#name").val().length() > 0 ){
		if($("#u_nick").val().length() > 0 ){
			if($("#u_email1").val().length() > 0 && $("#u_email2").val().length() > 0){
				if($("#u_zipCode").val().length() > 0 && $("#u_address1").val().length() > 0 && $("#u_address2").val().length() > 0){
					if($('input:radio[name=u_gender]:checked').val() !=undefined ){
						if($("#u_mobile1").val().length() > 0 && $("#u_mobile2").val().length() > 0 && $("#u_mobile3").val().length() > 0){
							$(".modal-header").text(" 회원 정보 수정 완료 " );
							 $(".modal-body").text(" 회원 정보 수정이 성공적으로 이루어 졌습니다..");
							 $('#exampleModal').modal('show');
						}
						else{
							$(".modal-header").text(" 회원 정보 수정 필수 요소 체크 " );
							 $(".modal-body").text(" 모바일은 반드시 입력되어야 합니다. ");
							 $('#exampleModal').modal('show');
							
							return false;
						}
					}
					else{
						$(".modal-header").text(" 회원 정보 수정 필수 요소 체크 " );
						 $(".modal-body").text(" 성별은 반드시 입력되어야 합니다. ");
						 $('#exampleModal').modal('show');
						return false;
					}
					
				}
				else{
					$(".modal-header").text(" 회원 정보 수정 필수 요소 체크 " );
					 $(".modal-body").text(" 주소는 반드시 입력되어야 합니다. ");
					 $('#exampleModal').modal('show');
					return false;
				}
			}
			else{
				$(".modal-header").text(" 회원 정보 수정 필수 요소 체크 " );
				 $(".modal-body").text(" 이메일 인증은 반드시 완료되어야 합니다. ");
				 $('#exampleModal').modal('show');
				return false;
			}
		}
		else{
			$(".modal-header").text(" 회원 정보 수정 필수 요소 체크 " );
			 $(".modal-body").text(" 닉네임은 반드시 입력되어야 합니다. ");
			 $('#exampleModal').modal('show');
			return false;
		}
	}
	else{
		$(".modal-header").text(" 회원 정보 수정 필수 요소 체크 " );
		 $(".modal-body").text(" 이름은 반드시 입력되어야 합니다. ");
		 $('#exampleModal').modal('show');
		return false;
	}

	
});

//비밀번호 찾기
/* id먼저 입력하고, 입력한 id를 토대로 ajax이용하여 디비와통신후 
 * 입력한 id에 해당하는 이메일이 맞는지 확인하고, 이메일인증을 진행한다. */
/*인증이 완료되면, pass창과 비밀번호 변경 창이 보이게 한다.*/
$("#btnforgotpass").click(function() {
	
	var id = document.getElementById("forgot_joinId").value;
	var name = document.getElementById("forgot_name").value;
	var email1 = document.getElementById("forgot_email1").value;
	var email2 = document.getElementById("email2").value;
	if(id.length<=0||name.length<=0){
		$(".modal-header").text(" 비밀번호 찾기 오류 " );
		$(".modal-body").text(" Id와 name이 비었습니다. 빈칸을 채워주세요. ");
		$('#exampleModal').modal('show');
		
		$("#forgot_joinId").focus().val();
		return false;
	}
	else{
		$("#forgot_email1").focus().val();
	}
	var email = email1+"@"+email2;
	console.log("email = " + email);
	
	var $parent = $(this).parent();
	
	$.ajax({
		url:"forgotPass.ajax",
		type:"get",
		data:"id="+id,
		dataType:"json",
		success:function(data){
			
			if(true){
				if(data!=null){
					if(data.id==id&&data.name==name){
						if(data.email==email){
							$("#emailFlag").text("[ "+email+" ]"+ '입력하신 이메일로 인증번호가 발송되었습니다.');
							$("#btnforgotpass").prop('disabled',true);
							$.ajax({
								url:"emailCheck.ajax",
								type:"get",
								data:"email1="+email1+"&email2="+email2,
								success:function(responseData){
									$("#emailFlag").text("[ "+email+" ]"+ '이메일 인증이 진행중입니다. 잠시만 기다려주세요.');
									var obj = eval("("+ responseData+ ")");
									var authNum=obj.authNum;
									console.log("여기는 오는가???? authNum : " + authNum);
									$parent.slideDown(2000).append('<input type="text" style="width:150px;" class="form-control" name="authNum" id="authNum" size="5" placeholder="인증번호 입력"/>');
									//.prependTo('#btnEmailCode');
									$('<input type="button" id="btnauthNum" class="btn btn-outline-info" value="인증번호 확인"/>')
									.slideDown(2000).appendTo($parent);
									
									$("#btnauthNum").click(function(){
										console.log("#authNum");
										user_authNum=$("#authNum").val(); //document.getElementById("authNum").value;
										if(authNum==user_authNum){
											$("#authNum").remove();
											$("#btnauthNum").remove();
											$("#btnEmailCode").val('Complete');
											var e1 = document.getElementById("forgot_email1");
											var e2 = document.getElementById("email2");
											var e3 = document.getElementById("email3");
											e1.readOnly =true;
											e1.style.backgroundColor="#dcdcdc";
											e2.readOnly =true;
											e2.style.backgroundColor="#dcdcdc";
											e3.readOnly =true;
											e3.style.backgroundColor="#dcdcdc";
											$("#btnEmailCode").prop('disabled',true);
											$("#emailFlag").text("[ "+email+" ]"+ '이메일 인증이 완료되었습니다.');
											$("#emailFlag").css({color : "green"});
											$('<i class="fa fa-circle-o"></i>').prependTo('#emailFlag');
											$("#forgot_pass1").show(1000);
											$("#forgot_pass2").show(2000);
											$("#btnPassForgot").show(3000);
											$("#pass").focus().val("");
										}
										else{
											$(".modal-header").text(" 비밀번호 찾기 이메일 인증 오류 " );
											 $(".modal-body").text(" 인증번호가 유효하지 않습니다. 당신의 이메일을 확인해보세요. ");
											 $('#exampleModal').modal('show');
											 
											$("#emailFlag").text("[ "+user_authNum +" ]"+ '이메일 인증 실패');
											$("#authNum").focus().val("");
											return false;
										}
									});
								},//success 끝
								error:function(xhr,status,error){
								alert("error :" + xhr.statusText + " ," + status + " ," + error);
								}
							});//안에 ajax 끝
						}//if(data.email==email)끝
						else{
							$(".modal-header").text(" 비밀번호 찾기 이메일 인증 오류 " );
							 $(".modal-body").text(" 가입당시 입력한 이메일과 다릅니다. ");
							 $('#exampleModal').modal('show');
							 
							$("#emailFlag").text("이메일을 다시 입력해주세요.");
							$("#email1").focus().val("");
							return false;
						}
					}
					else{
						$(".modal-header").text(" 비밀번호 찾기 오류 " );
						 $(".modal-body").text(" 입력한 ID와 일치하는 이름이 없습니다. ");
						 $('#exampleModal').modal('show');
						 
						$("#nameFlag").text("이름을 다시 입력해주세요.");
						$("#nameFlag").focus().val("");
						return false;
					}
				}
				else{
					$(".modal-header").text(" 비밀번호 찾기 오류 " );
					 $(".modal-body").text(" 입력한 ID의 회원은 없습니다. ");
					 $('#exampleModal').modal('show');
					 
					$("#idFlag").text("다시 입력해주세요.");
					$("#idFlag").focus().val("");
					return false;
				}
			}
		},
		error:function(xhr,status,error){
			alert("error :" + xhr.statusText + " ," + status + " ," + error);
			}
	});//겉에 ajax끝
});
$("#forgot_joinId").change(function(){
	var id = document.getElementById("forgot_joinId").value;
	if(id.length>=0){
		$("#idFlag").hide(300,function(){
			$("#idFlag").css({color : "green"});
			$("#idFlag").text("이메일 인증을 통해 비밀번호 찾기를 실행해 주세요.").show(700);
			$('<i class="fa fa-circle-o"></i>').prependTo('#idFlag').show(300);
			
		});
	}
});

$("#forgot_name").change(function(){
	var name = document.getElementById("forgot_name").value;
	if(name.length>=0){
		$("#nameFlag").fadeOut(300,function(){
			$("#nameFlag").css({color : "green"});
			$("#nameFlag").text("이메일 인증을 통해 비밀번호 찾기를 실행해 주세요.").fadeIn(700);
			$('<i class="fa fa-circle-o"></i>').prependTo('#nameFlag').fadeIn(300);
			
		});
	}
});

//이메일 입력전에 id랑 이름 무조건입력하게끔.. 널이면 얼럿창띄우고 다시 입력하게
$("#forgot_email1").change(function(){
	id = $("#forgot_joinId").val();
	name = $("#forgot_name").val();
	console.log(id + ", " + name);
	if(id.length<=0||name.length<=0){
		$(".modal-header").text(" 비밀번호 찾기 오류 " );
		$(".modal-body").text(" Id와 name이 비었습니다. 빈칸을 채워주세요. ");
		$('#exampleModal').modal('show');
		
		$("#forgot_joinId").focus().val();
		return false;
	}
	else{
		$("#forgot_email2").focus().val();
	}
	
});

/*	//모달 창 제어 자바스크립트
$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever')
	  
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body').text("sadasdasdasdasd")
	})*/





				/*
				 * 
	$("#nameFlag").fadeOut(3000);
	
	$("#nameFlag").text("이메일 인증을 통해 비밀번호 찾기를 실행해 주세요.").fadeIn(3000);
	$("#idFlag").css({color : "green"});
	$("#nameFlag").css({color : "green"});
	
	$('<i class="fa fa-circle-o"></i>').prependTo('#nameFlag');
				 * function emailcheck(email1,email2){ //유효성 검사
				 * if(!joinC.email1.value||!joinC.email2.value){
				 * alert("emailerror1"); joinC.email1.focus(); return;
				 * }else{ if(joinC.email1.value){
				 * console.log(joinC.email1.value);
				 * if(joinC.email2.value==0){ //직접입력부분
				 * if(joinC.email1.value.indexOf("@")==-1){
				 * alert("emailerror2"); joinC.email1.focus(); return false; }
				 * 
				 * }else{ //선택입력 if(joinC.email1.value.indexOf("@")!=-1){
				 * alert("emailerror3"); joinC.email1.focus(); return false; } } } }
				 * //인증을 위해 새창으로 이동 var
				 * url="emailCheck.jsp?email1="+email1+"&email2="+email2;
				 * open(url,"emailwindow","statusbar=no,scrollbar=no,menubar=no,width=400,heigth=200"); }
				 * 
				 * 
				 * 
				 * //function emailcheck 끝 (이메일 유효성검사)
				 */
				

			/*	$("#loginFormLogin").click(function() {
					var user_id = document.loginC.L_id.value;
					var user_pass = document.loginC.value;
					// var
					// user_id=document.getElementById("loginFormUserId").value;
					// var
					// user_pass=document.getElementById("loginFormUserPass").value;
					// alert(user_id+"<br/>"+user_pass);
					regId = /^[가-힣a-zA-Z0-9]{5,20}$/;
					regPass = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]{4,30}$/;
					if (regId.test(user_id) && regPass.test(user_pass)) {
						document.loginC.action = "login.do";
						document.loginC.submit();
					} else if (regPass.test(user_pass)) {
						alert("잘못된 아이디 형식입니다. 다시 입력해주세요");
						location.reload();
					} else {
						alert("잘못된 비밀번호 형식입니다. 다시 입력해주세요");
						location.reload();
					}
				});
*/
/*					
*/
				/*$(".loginFormJoin").click(function() {
					document.loginC.action = "joinForm.do";
					document.loginC.submit();
				});
				$(".loginFormUpdate").click(function() {
					document.loginC.action = "update.do";
					document.loginC.submit();
				});*/



});// 맨위상단 끝

//이메일 인증처리위한fucntion 시작
function confirmemail(emailconfirm_value, authNum) {
	// 입력한값이없거나, 인증코드가 일치하지않을 경우
	if (!emailconfirm_value || emailconfirm_value != authNum) {
		$(".modal-header").text(" 이메일 인증 오류 " );
		$(".modal-body").text(" 인증번호가 틀립니다. ");
		$('#exampleModal').modal('show');
		
		emailconfirm_value = "";
		self.close();
	}
	// 인증코드가 일치하는 경우
	else if (emailconfirm_value == authNum) {
		$(".modal-header").text(" 이메일 인증 성공 " );
		$(".modal-body").text(" 인증이 정상적으로 처리되었습니다. ");
		$('#exampleModal').modal('show');
		

		emailconfirm_value = "";
		self.close();
		opener.document.joinC.emailconfirm_value.value = 1;
	}
}
//회원 가입용 다음 우편번호
function findZipCode() {
	birth1 = $("#birth1").val();
	birth2 = $("#birth2").val();
	birth3 = $("#birth3").val();
	if(birth1==0||birth1==null){
		$(".modal-header").text(" 생년월일 입력 누락 " );
		$(".modal-body").text(" Birth의 년도를 선택해주세요. ");
		$('#exampleModal').modal('show');
		
		$("#birth1").focus().val("");
		return;
	}	
	else if(birth2==0||birth2==null){
		$(".modal-header").text(" 생년월일 입력 누락 " );
		$(".modal-body").text(" Birth의 달을 선택해주세요. ");
		$('#exampleModal').modal('show');
		$("#birth2").focus().val("");
		return;
	}
	else if(birth3==0||birth3==null){
		$(".modal-header").text(" 생년월일 입력 누락 " );
		$(".modal-body").text(" Birth의 일을 선택해주세요. ");
		$('#exampleModal').modal('show');
		$("#birth3").focus().val("");
		return;
	}
	new daum.Postcode({
		oncomplete : function(data) {
			var fullAddr = ""; // 최종 주소 변수
			var extraAddr = ""; // 조합형 주소 변수
			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			// 사용자가 도로명 주소를 선택했을 경우
			if (data.userSelectedType === "R") {
				fullAddr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				// 모두 도로명 주소를 적용했다.
				fullAddr = data.roadAddress;
				// fullAddr = data.jibunAddress;
			}
			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === "R") {
				// 법정동명이 있을 경우 추가한다.
				if (data.bname !== "") {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName != "") {
					extraAddr += (extraAddr !== "" ? ", " + data.buildingName
							: data.buildingName);
				}
				// 조합형 주소가 있으면 조합형 주소를 ()로 묶어서 최종 주소에 추가한다.
				fullAddr += (extraAddr !== "" ? "(" + extraAddr + ")" : "");
			}
			// 우편번호와 주소 정보를 해당 입력상자에 출력한다.
			$("#zipCode").val(data.zonecode);
			$("#address1").val(fullAddr);
			// 커서를 상세주소 입력상자로 이동한다.
		}
	}).open();
}

//회원수정용 업데이트 다음 우편번호
function u_findZipCode() {
	birth1 = $("#u_birth1").val();
	birth2 = $("#u_birth2").val();
	birth3 = $("#u_birth3").val();
	if(birth1==0||birth1==null){
		$(".modal-header").text(" 생년월일 입력 누락 " );
		$(".modal-body").text(" Birth의 년도를 선택해주세요. ");
		$('#exampleModal').modal('show');
		
		$("#birth1").focus().val("");
		return;
	}	
	else if(birth2==0||birth2==null){
		$(".modal-header").text(" 생년월일 입력 누락 " );
		$(".modal-body").text(" Birth의 달을 선택해주세요. ");
		$('#exampleModal').modal('show');
		$("#birth2").focus().val("");
		return;
	}
	else if(birth3==0||birth3==null){
		$(".modal-header").text(" 생년월일 입력 누락 " );
		$(".modal-body").text(" Birth의 일을 선택해주세요. ");
		$('#exampleModal').modal('show');
		$("#birth3").focus().val("");
		return;
	}
	new daum.Postcode({
		oncomplete : function(data) {
			var fullAddr = ""; // 최종 주소 변수
			var extraAddr = ""; // 조합형 주소 변수
			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			// 사용자가 도로명 주소를 선택했을 경우
			if (data.userSelectedType === "R") {
				fullAddr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				// 모두 도로명 주소를 적용했다.
				fullAddr = data.roadAddress;
				// fullAddr = data.jibunAddress;
			}
			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === "R") {
				// 법정동명이 있을 경우 추가한다.
				if (data.bname !== "") {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName != "") {
					extraAddr += (extraAddr !== "" ? ", " + data.buildingName
							: data.buildingName);
				}
				// 조합형 주소가 있으면 조합형 주소를 ()로 묶어서 최종 주소에 추가한다.
				fullAddr += (extraAddr !== "" ? "(" + extraAddr + ")" : "");
			}
			// 우편번호와 주소 정보를 해당 입력상자에 출력한다.
			$("#u_zipCode").val(data.zonecode);
			$("#u_address1").val(fullAddr);
			// 커서를 상세주소 입력상자로 이동한다.
		}
	}).open();
}
	
</script>