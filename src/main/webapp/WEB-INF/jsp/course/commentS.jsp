<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<script>
var cosno = '${course.cosno}'; 
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭
    var insertData = $('[name=commentInsertForm]').serialize(); //cosno=50&inlineRadioOptions=option5&content=dsadsad
    commentInsert(insertData); 
	console.log(insertData);
	
});
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : '/comment/list',
        type : 'get',
        data : {'cosno':cosno},
        success : function(data){
        	console.log(data+"commentList data값");
            var a =''; 	
            /*  $.each(data, function(key, value){ //jquery반복문 
            
            	a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';   //댓글 한줄전체
                a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.writer; //댓글 정보
              	a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>'; //댓글 수정
              	//a += '<a onclick="commentUpdate(value.cno, value.content);"> 수정 </a>'; //댓글 수정 이부분 이해 잘안감...
                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>'; //댓글 삭제
                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>'; //댓글 내용
                a += '</div></div>';
            }); 
            */
             $.each(data, function(key, value){ //jquery반복문 
                
            	a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';   //댓글 한줄전체
                /* a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.writer; //댓글 정보 */
                a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.writer+'/날짜 : '+value.reg_date; //댓글 정보 new 2
                /* a += '<fmt:formatDate value="${'+value.reg_date+'}" pattern="yyyy.MM.dd HH:mm:ss"/>; //test날짜포맷 */
              	/*  a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>'; //댓글 수정 */ 
              	 /* a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\','+value.eva_count+');"> 수정 </a>'; //댓글 수정 new  */ 
              	if(value.writer == "<%=(String)session.getAttribute("nick")%>"){
              	a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\','+value.eva_count+');"> 수정 </a>'; //댓글 수정 new 2
              	 //a += '<a onclick="commentUpdate(value.cno, value.content);"> 수정 </a>'; //댓글 수정 이부분 이해 잘안감...
                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>'; //댓글 삭제
              	}
                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p><p>평점 :'+value.eva_count+'</p>'; //댓글평점 추가 내용 */
                /* a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>'; //댓글 내용 */
                a += '</div></div>';
            }); 
            $(".commentList").html(a); //commentList에 출력결과를 뿌려준다????
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){ /* //url형식 */
	console.log("ajax error?");
    $.ajax({
        url : '/comment/insert', 
        type : 'post',  
        data : insertData, 
        success : function(data){  //요청에 성공할 경우호출
        	console.log("check1");
            if(data == 1) {
            	console.log(data);
                commentList(); //댓글 목록 reload
                $('[name=content]').val(''); //content의 값을 초기화,and 댓글다시 쓸수있게 보여줌.???
                /* $('[name=eva_count]').val('1');    */		
            }else{
            	console.log("error");
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, content, eva_count){
	var a = '';
    console.log(eva_count+"update");
   
    
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
	    	a+='<br>';
    		a+= '<label class="radio-inline">';
	    	a+=	'<input type="radio" name="inlineRadio" id="inlineRadio1" value="1" checked="checked"> 1';
	  		a+='</label>'
	    	a+=	'<label class="radio-inline">'
    		a+=	 ' 	<input type="radio" name="inlineRadio" id="inlineRadio2" value="2"> 2';
    		a+=	'</label>'
    		a+=	'<label class="radio-inline">'
    		a+=	 ' <input type="radio" name="inlineRadio" id="inlineRadio3" value="3"> 3';
    		a+=	'</label>';
    		a+=	'<label class="radio-inline">';
    		a+=	'  <input type="radio" name="inlineRadio" id="inlineRadio4" value="4"> 4';
    		a+=	'</label>';
    		a+=	'<label class="radio-inline">';
    		a+=	'  <input type="radio" name="inlineRadio" id="inlineRadio5" value="5"> 5';
    		a+=	'</label>';
   	
   	
    a += '</div>';
    
    
    $('.commentContent'+cno).html(a); 
   
    /* $("#inlineRadio"+eva_count).attr("checked","checked"); */
    console.log("check1");
    /* $("body").attr("isuse","o kay");  */
}


//댓글 수정
function commentUpdateProc(cno){
   var updateContent = $('[name=content_'+cno+']').val();
   var eva_count = $("input[name=inlineRadio]:checked").val(); // input 태그의 name이 트루면 값을 value값을 가져온다.
   
	$.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno, 'eva_count' : eva_count},
        success : function(data){
        	console.log(eva_count+"eva_count 넘어왓나?");
            if(data == 1) commentList(cosno); //댓글 수정후 목록 출력 
        }
    }); 
}
 
//댓글 삭제 
function commentDelete(cno){
    $.ajax({
        url : '/comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(cosno); //댓글 삭제후 목록 출력 
        }
    });
}

//댓글 평점 매기는 함수
function commentEva(){
	/* var eva_count = $('[name=eva_count]').val(); */
	$.ajax({		
		url : '/comment/eva',
		type:'get',
		data : {'cosno':cosno},  //url에 전달할 인자값.
		/* dataType: 'json', */ //쓰나안쓰나 다를게없음.
		success : function(data){
				var a=0;
				var c=0;
				var r=0;
				$.each(data, function(key, value){ 
					a+=value.eva_count;
					c+=1;
				});
				r=a/c;
			
		}
	});
}

 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
    commentEva(); //페이지에 평점 출력
});
 
 
 
</script>


