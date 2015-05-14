<script type="text/javascript">
$('ducument').ready(function(){
	$('#loginSubmit').bind('click',function(){
    var errorMessage = null;
    var objFocus = null;
    
    if (document.loginForm.id.value=="") {
    	alert("아이디를 넣어주세요.");
       	document.loginForm.id.focus();
       	return false;
    } else if (document.loginForm.password.value=="") {
		alert("비밀번호를 넣어주세요.");
       	document.loginForm.password.focus();
       	return false;
    }else if(errorMessage == null) {
    	$.post("../app/user/chechkedloginUser?id="+$('#id').val()+"&password="+$('#password').val(),function(data){
			   if(data==="password"||data==="id"){
				   	alert("비밀번호또는 아이디(이메일)이 일치하지 않습니다.");
			       	document.loginForm.password.focus();
			   }else{
				   alert("로그인을 하셨습니다.")
				   $('#loginForm').submit();
				   //여기에 다음 로그인으로 
			   }
		   });
    }
    return false;
	});
});
</script>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form method="POST" action="#" name="loginForm" id="loginForm">
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModal" aria-hidden="true">
		<div class="modal-dialog" style="background-color: #FF9933">
			<div class="modal-content"  style="background-color: #FF9933;">
				<div class="modal-header"
					style="background-color: #FF9933; border-color:black">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">로그인</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="recipient-name" class="control-label">아이디</label>
						<input type="text" class="form-control" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">비밀번호</label>
						<input type="password" class="form-control" id="password" name="password">
					</div>
				</div>
				<div class="modal-footer" style="border-color:black">
					<button type="submit" class="btn btn-primary" id="loginSubmit"
						style="background-color: #FFFFFF; border-color: #FFFFFF; color: black">로그인</button>
<!-- 					<input type="image" src="login.gif" alt="로그인" /> -->
				</div>
			</div>
		</div>
	</div>
</form>
