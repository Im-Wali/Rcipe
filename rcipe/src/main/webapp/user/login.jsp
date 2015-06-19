<script type="text/javascript">
	$("document").ready(function() {

		$('#loginSubmit').bind('click', function() {
			var errorMessage = null;
			var objFocus = null;

			if (document.loginForm.id.value == "") {
				alert("아이디를 넣어주세요.");
				document.loginForm.id.focus();
				return false;
			} else if (document.loginForm.password.value == "") {
				alert("비밀번호를 넣어주세요.");
				document.loginForm.password.focus();
				return false;
			} else if (errorMessage == null) {
				$.post("../user/chechkedloginUser", {
					id : $('#email').val(),
					password : $('#password').val()
				}, function(data, str) {
					if (data === "false") {
						alert("비밀번호또는 아이디(이메일)이 일치하지 않습니다.");
						document.loginForm.password.focus();
					} else if (data == "none") {
						alert("탈퇴된 회원입니다.")
					} else if (data == "true") {
						alert("로그인을 하셨습니다.");
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
<jsp:include page="losePassword.jsp"></jsp:include>

<form method="post"
	action="../../app/user/userLogin"
	name="loginForm" id="loginForm">
	<div class="row">
		<div class="col-sm-6 col-md-4 col-md-offset-4">
			<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
				aria-labelledby="loginModal" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header " style="border-color: black;"
							align="center">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="exampleModalLabel" style=";font-size:2em ">로그인</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">

								<label for="recipient-name" class="control-label">이메일</label> <input
									type="text" class="form-control" id="email" name="email">

							</div>
							<div class="form-group">
								<label for="message-text" class="control-label">비밀번호</label> <input
									type="password" class="form-control" id="password"
									name="password">
							</div>
							<div id="losePasswordDiv" class="form-group"></div>
						</div>
						<div align="center" style="margin:1%;">
							<button type="submit" class="btn btn-lg btn-info"
								id="loginSubmit" style="width: 60%">로그인</button>
						</div>
						<div align="center" style="margin:1%;">
							<button type="button" class="btn btn-lg btn-info" id="loseButton"
								style="width: 60%" id="change_password"
								data-toggle="modal" data-target="#modifyLosePasswordModal"
								data-backdrop="false" data-dismiss="modal" aria-label="Close">비밀번호
								찾기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
