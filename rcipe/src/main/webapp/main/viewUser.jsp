<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<HEAD>
<title>Recipe</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/fileUpload.js"></script>
<style type="text/css">
.form-login {
	background-color: #DDDDDD;
	padding-top: 10px;
	padding-bottom: 20px;
	padding-left: 20px;
	padding-right: 20px;
	border-radius: 15px;
	border-color: #d2d2d2;
	border-width: 5px;
	box-shadow: 0 1px 0 #cfcfcf;
}
</style>
<script type="text/javascript">
$("document").ready(function() {
	function selectCategory(value) {
		document.getElementById("select_category").innerHTML = value;
		document.getElementById("selectCartegory").val = value;
	};

	$("#deleteUser").click(function() {
		$.get('../app/user/deleteUser?nickname=user01', function(data) {
		   alert(data);
		});
		alert('탈퇴되셨습니다.');
	});
});
</script>
</HEAD>
<body>
	<jsp:include page="menuBar.jsp"></jsp:include>
	<div style="margin-bottom: 2%; margin-top: 2%" align="center">
		<h2 style="font-weight: bold;">회원정보 보기</h2>
	</div>
	<div class="row" style="margin-top: 4%; text-align: left;">
		<div class="col-md-2 "></div>
		<div class="col-md-8 ">
			<form action="#" method="POST">
				<div class="form-login " style="margin-bottom: 2%;">
					<div class="form-login "
						style="background-color: white; margin-top: 1%">
						<hr />
						<div style="margin-top: 3%">
							<div style="font-size: 2em; margin-top: 1%; margin-left: 2%">프로필사진</div>
							<div>
								<img src="../img/001.jpg" class="img-circle" role="button"
									style="width: 150px; height: 150px; margin-right: 1%; margin-top: 1%"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false" id="fileUpload">
							</div>
							<div style="margin-left: 2%; margin-top: 1%">
								<button type="button" class="btn btn-warning " id="chage_profil">
									프로필 사진변경</button>
							</div>
						</div>
						<hr />
						<div style="margin-top: 3%">
							<span style="font-size: 2em">닉네임</span><span
								style="margin-left: 4%; font-size: 2em">:</span><span
								style="font-size: 2em">아이디</span>
						</div>
						<hr />
						<div style="margin-top: 3%">
							<span style="font-size: 2em">이메일</span><span
								style="margin-left: 4%; font-size: 2em">:</span><span
								style="font-size: 2em">이메일</span>
						</div>
						<hr />
						<div style="margin-top: 3%">
							<span style="font-size: 2em">비밀번호</span><span
								style="margin-left: 2%; font-size: 2em">:</span><span></span>
							<button type="button" class="btn btn-warning " id="chage_profil"
								style="float: right" id="change_password"
								style="float: right;margin-right:1% " data-toggle="modal"
								data-target="#modifyPasswordModal" data-backdrop="false">비밀번호
								변경</button>
						</div>
						<hr />
						<div style="margin-top: 3%; margin-bottom: 3%">
							<span style="font-size: 2em">가입날짜</span><span
								style="margin-left: 2%; font-size: 2em">:</span><span
								style="font-size: 2em">2015-05-06</span>
						</div>
						<hr />
						<div align="right">
							<button type="button" class="btn btn-warning " id="deleteUser"
								style="margin-right: 1%">회원탈퇴</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-2 "></div>
	</div>
	<jsp:include page="userModify.jsp"></jsp:include>
</body>
</HEAD>