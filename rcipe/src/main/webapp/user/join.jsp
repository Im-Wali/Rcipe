<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$("document").ready(function(){
	//이메일 형식체크,중복체크
	var isSubmit=false;
	var isPassword=false;
	var isPassword2=false;
	var timer;
	$('.joinEmail').bind('keyup',function (){
		   var chk1 = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		   var p=$(this).val();
		   isSubmit=false;
		   if(! chk1.test(p)){
		      //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식일 경우
			   $('#joinEmailDiv').html(function(index,html){
		    		return "<span style='color:red;'>이메일 형식과 일치하지 않습니다.</span>";
		    	});
		   }else{
			   //AJAX사용
			   var str;
			   $.get("../user/checkedEmail?email="+p,function(data){
				   if(data==="true"){
				 	  	str= "<span style='color:blue;'>사용가능한 이메일입니다.</span>";
				 	  	$('#isEmail').val("true");
				   }else{
					   str= "<span style='color:red;'>사용중인  이메일입니다.</span>";
					   $('#isEmail').val("false");
				   }
				   $('#joinEmailDiv').html(str);
			   });
		   }
	});
	$(".joinPassword1").bind('keyup',function () {
		var p=$(this).val();
	    chk1 = /^[a-z\d]{8,12}$/i;  //a-z와 0-9이외의 문자가 있는지 확인
	    chk2 = /[a-z]/i;  //적어도 한개의 a-z 확인
	    chk3 = /\d/;  //적어도 한개의 0-9 확인
	    if(!chk1.test(p)){
	    	isPassword2=false;
	    	$('#joinPassword1Ckecked').html(function(index,html){
	    		return "<span style='color:red;'>영어,숫자 조합의 8자이상 12자이하을 입력하세요</span>";
	    	});
	    }else if(!chk2.test(p)){
	    	isPassword2=false;
	    	$('#joinPassword1Ckecked').html(function(index,html){
	    		return "<span style='color:red;'>적어도 하나이상의 영어가 들어가야합니다.</span>";
	    	});
	    }else if(!chk3.test(p)){
	    	isPassword2=false;
	    	$('#joinPassword1Ckecked').html(function(index,html){
	    		return "<span style='color:red;'>적어도 하나이상의 숫자가 들어가야합니다.</span>";
	    	});
	    }else{
	    	isPassword2=true;
	    	$('#joinPassword1Ckecked').html(function(index,html){
	    		return "<span style='color:blue;'>올바른 비밀번호입니다.</span>";
	    	});
	    }
	    return chk1.test(p) && chk2.test(p) && chk3.test(p);
	} );
	$(".joinPassword2").bind('keyup',function () {
		var p=$(this).val();
		var s=$('.joinPassword1').val();
		if(p===s&&isPassword2){
			$('#joinPassword1Ckecked2').html(function(index,html){
	    		return "<span style='color:blue;'>비밀번호 확인 완료</span>";
	    	});
	    	isPassword=true;
		}else{
			$('#joinPassword1Ckecked2').html(function(index,html){
	    		return "<span style='color:red;'>비밀번호가 같지 않습니다.</span>";
	    	});
	    	isPassword=false;
		}
	});
	$(".joinNickname").bind('keyup',function () {
		chk1 = /^[a-z\d\가-힝]{4,10}$/i;
		chk2 = /[가-힝]/;  //적어도 한개의 a-z 확인
	    chk3 = /[a-z]/i;  //적어도 한개의 0-9 확인
	    chk4 = /^[가-힝]{2,10}$/i;
		var p=$(this).val();
		if(chk4.test(p)||(chk1.test(p)&&(chk2.test(p)||chk3.test(p)))){
			//AJAX
			 var str;
			   $.get("../user/checkedNickname?joinNickname="+p,function(data){
				   if(data==="true"){
				 	  	str= "<span style='color:blue;'>사용가능한 닉네임입니다.</span>";
				 	  	$('#isNickname').val('true');
				   }else{
					   str= "<span style='color:red;'>사용중인  닉네임입니다.</span>";
					   $('#isNickname').val('false');
				   }
				   $('#joinNicknameCkecked').html(str);
			   });
			
		}else{
			$('#joinNicknameCkecked').html(function(index,html){
	    		return "<span style='color:red;'>한글 2자이상 또는 영어,한글,숫자로 조합으로 이루어진 4자 이상 10자이내로 입력하세요 </span>";
	    	});
		}
	});
	$("#sendCheckEmailNumber").click(function () {
		var check=$('#isEmail').val();
		var joinEmail=$('.joinEmail').val();
		if(check==='false'){
			$('#sendCheckNumberDiv').html(function(index,html){
	    		return "<span style='color:red;'>이메일을 제대로 작성되지 않았습니다.</span>";
	    	});
		}else{
			alert("인증번호를 발송했습니다. 5분내로 입력해주세요");
			$('#checkSendNumber').attr('disabled',false); 
			$('#checkSendNumber').css('background-color','#FFFFFF');
			 $('#randomNumber').val('');
			 $.get("../app/email/send?email="+joinEmail+"&type=join",function(data){
				 $('#randomNumber').val(data);
			 });
			$("#sendCheckEmailNumber").html('인증번호 재발송');
			clearInterval(timer);
			$("#numberMinuteTimer").html("5");
			$("#numberTimer").html(":");
			$("#numberSecondTimer").html("00");
			timer = setInterval(function () {
				minute=$("#numberMinuteTimer").html();
				second=$("#numberSecondTimer").html();
				if(second == 0 && minute == 0){
					alert('인증시간이 끝났습니다.');
					$('#randomNumber').val('false');
					clearInterval(timer);
				}else{
					second--;
					// 분처리
					if(second < 0){
						minute--;
						second = 59;
					}
				}
				$("#numberMinuteTimer").html(minute);
				$("#numberSecondTimer").html(second);
	    	}, 1000);/* millisecond 단위의 인터벌 */
		}
	});
	$("#checkSendNumber").click(function () {
		var num=$('#randomNumber').val();
		var sendNum=$('#sendNumber').val();
		 if(num==="false"){
			alert("인증번호 발송이 되지않았습니다.");
			$('#sendNumber').val('');
		}else if(sendNum===num){
			alert('인증완료');
			$('#checkSendNumber').attr('disabled',true); 
			$('#checkSendNumber').css('background-color','#838383');
			clearInterval(timer);
			isSubmit=true;
		}else{
			alert("인증번호가 일치하지않습니다.");
			$('#sendNumber').val('');
		}
	});
	$("#joinSubmit").click(function (event) {
		var isNickname=$('#isNickname').val();
		var isEmail=$('#isEmail').val();
		if(isEmail==="false"){
			alert('이메일을 정확하게 입력해주세요');
			event.preventDefault();
			$('.joinEmail').focus();
		}else if(isNickname==="false"){
			alert('닉네임을 정확하게 입력해주세요');
			event.preventDefault();
			$('.joinNickname').focus();
		}else if(isPassword==false){
			alert('패스워드를 정확하게 입력해주세요');
			$('.joinPassword1').focus();
			event.preventDefault();
		}else if(isSubmit==false){
			alert('이메일 인증을 해주세요');
			$('#sendNumber').focus();
			event.preventDefault();
		}else{ 
			alert('회원가입을 축하합니다.');
		}
	}); 
	
});
</script>
<!-- nickname사용 가능할 때 true로 바꾸어줌 -->
<input type='hidden' id='isNickname' value='false'>
<!-- 이메일사용 가능할 때 true로 바꾸어줌 -->
<input type='hidden' id='isEmail' value='false'>
<!-- 인증번호를 저자하는 부분-->
<input type='hidden' id='randomNumber' value='false'>
<form method="post" action="${pageContext.servletContext.contextPath }/app/user/joinUser"  id="joinUser" name="joinUser">
	<div class="modal fade" id="joinModal" tabindex="-1" role="dialog"
		aria-labelledby="joinModal" aria-hidden="true">
		<div class="modal-dialog" style="background-color: #FF9933">
			<div class="modal-content" style="background-color: #FF9933;">
				<div class="modal-header"
					style="background-color: #FF9933; border-color: black">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel" style="border-color:#FF9933">회원가입</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="recipient-name" class="control-label">이메일</label> <input
							type="text" class="form-control joinEmail" id="email" name="email"
							placeholder="이메일이 아이디로 사용됩니다.">
							<div id="joinEmailDiv"></div>
					</div>
					<div class="form-group">
						<label for="recipient-name" class="control-label">닉네임</label> <input
							type="text" class="form-control joinNickname" id="nickname" name="nickname"
							placeholder="한글 2자이상 또는 영어,한글,숫자로 조합으로 이루어진 4자 이상 10자이내로 입력하세요">
							<div id="joinNicknameCkecked"></div>
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">비밀번호</label> <input
							type="password" class="form-control joinPassword1" id="password" name="password" maxlength="15"
							placeholder="영어 또는 숫자로 이루어진 8자리 이상 15이하로 입력하세요 ">
							<div id="joinPassword1Ckecked"></div>
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">비밀번호 확인</label> <input
							type="password" class="form-control  joinPassword2" id="password2" maxlength="15"
							placeholder="비밀번호확인">
							<div id="joinPassword1Ckecked2"></div>
					</div>
					<div class="form-group">
						<label  for="recipient-name" class="control-label">인증번호입력</label> <input
							type="text" class="form-control" id="sendNumber" maxlength="8"
							placeholder="5분내로 입력해주세요">
						<div id="sendCheckNumberDiv"></div>
						<div align="right" style="font:bold;font-size:1.5em"><span id="numberMinuteTimer"></span><span id="numberTimer"></span><span id="numberSecondTimer"></span></div>
					</div>
					<div align="right">
						<button id="sendCheckEmailNumber" type="button" class="btn btn-primary"
							style="background-color: #FFFFFF; border-color: #FFFFFF; color: black; margin-bottom: 1%">인증번호
							발송</button>
						<button id="checkSendNumber" type="button" class="btn btn-primary" 
							style="background-color: #FFFFFF; border-color: #FFFFFF; color: black; margin-bottom: 1%">인증</button>
					</div>
				</div>
				<div class="modal-footer" style="border-color: black">
					<button  type="submit" class="btn btn-primary" id="joinSubmit"
						style="background-color: #FFFFFF; border-color: #FFFFFF; color: black">회원가입</button>
					<button type="reset" class="btn btn-primary"
						style="background-color: #FFFFFF; border-color: #FFFFFF; color: black">최소</button>
				</div>
			</div>
		</div>
	</div>
</form>
