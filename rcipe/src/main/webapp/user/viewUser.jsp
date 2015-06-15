<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/fileUpload.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/bootstrap-filestyle.js">
	
</script>
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
	$("document").ready(
			function() {
				$("#delete_profil").click(
						function() {
							$.get('../file/deleteProfile', function(data) {
								data = decodeURIComponent(data);
								data = data.replace(/\+/g, " ");
								alert(data);
								$("#fileUpload").attr("src",
										"../../images/userIcon.png");
							});
						});
				//파일 버튼에서 아이콘을 빼주는 script
				$(":file").filestyle('icon', false);

				//불리언 변수 함부로 ajxa가 실행하는것을 막는 변수
				//$(":file").filestyle('clear');이부분을 실행시에 또호출되기때문에
				var isFile = false;
				//프로필 수정 버튼에서 파일을 선택하면 실행한다. 파일을 업로드하는 AJAX
				$('#buttonProfileUpload').change(
						'onload',
						function() {
							if (isFile) {
								return;
							}
							isFile = true;
							var formData = new FormData();
							$.each($('#buttonProfileUpload')[0].files,
									function(i, file) {
										formData.append('file', file);
									});
							$.ajax({
								url : '../file/profileUpload',
								data : formData,
								processData : false,
								contentType : false,
								type : 'POST',
								success : function(data) {
									var str = decodeURIComponent(data);
									str = str.replace(/\+/g, " ");
									var str2 = str.split("massage")[1]
											.substring("1").split(",")[0];
									alert(str2);
									var str3 = str.split("changeImg")[1]
											.substring("1").split(",")[0];
									alert(str3);
									$("#fileUpload").attr("src",
											"../../images/" + str3);
									$(":file").filestyle('clear');
									isFile = false;
								},
								error : function(data) {
									alert("파일업로드에 실패했습니다.")
								}
							});
						});
			});
</script>
</HEAD>
<body>
	<input type="hidden" value="profileUpload" id="fileUploadUrl">
	<jsp:include page="/main/menuBar.jsp"></jsp:include>
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
							<div
								style="font-size: 2em; margin-top: 1%; margin-left: 2%; margin-bottom: 1%;"
								align="center">프로필사진</div>
							<div align="center">
								<c:if test="${user.userImage==null}">
									<img
										src="${pageContext.servletContext.contextPath}/images/userIcon.png"
										class="img-circle fileUpload" role="button"
										style="width: 150px; height: 150px; margin-top: 1%"
										aria-haspopup="true" aria-expanded="false" id="fileUpload">
								</c:if>
								<c:if test="${user.userImage!=null}">
									<img
										src="${pageContext.servletContext.contextPath}/images/${user.userImage}"
										class="img-circle fileUpload" role="button"
										style="width: 150px; height: 150px; margin-top: 1%"
										aria-haspopup="true" aria-expanded="false" id="fileUpload">
								</c:if>
							</div>
							<div style="margin-top: 1%" align="center">
								<span style="color: red; font: bold;">*바꿀 프로필 사진을 사진위로
									드래그 하면 자동으로 프로필 사진이 변경됩니다.</span>
							</div>
							<div style="margin-top: 1%" align="center">
								<input type="file" class="filestyle" id="buttonProfileUpload"
									data-buttonName="btn-warning" data-input="false"
									data-buttonText="프로필 수정">
							</div>
							<div style="margin-top: 1%" align="center">
								<button type="button" class="btn btn-warning "
									id="delete_profil">프로필 삭제</button>
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
									style="float: right; margin-right: 1%;" id="change_password"
									data-toggle="modal" data-target="#modifyPasswordModal"
									data-backdrop="false">비밀번호 변경</button>
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
									style="margin-right: 1%" data-toggle="modal"
									data-target="#deleteUserPWModal" data-backdrop="false">회원탈퇴</button>
							</div>
						</div>
					</div>
			</form>
		</div>
		<div class="col-md-2 "></div>
	</div>
	<jsp:include page="userModify.jsp"></jsp:include>
	<jsp:include page="userDeleteModify.jsp"></jsp:include>
</body>
</HEAD>