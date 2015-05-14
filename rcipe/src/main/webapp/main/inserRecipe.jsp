<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/fileUpload.js" ></script>
<style type="text/css">
body {
	background-color: #fff;
	-webkit-font-smoothing: antialiased;
	font: normal 14px Roboto, arial, sans-serif;
}

.container {
	padding: 25px;
	position: fixed;
}

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

h4 {
	border: 0 solid #fff;
	border-bottom-width: 1px;
	padding-bottom: 10px;
	text-align: center;
}

.form-control {
	border-radius: 10px;
}

.wrapper {
	text-align: center;
}
</style>
</HEAD>

<BODY>
	<div><jsp:include page="menuBar.jsp"></jsp:include></div>
	<div class="row" style="margin-top: 4%; text-align: left;">
		<div class="col-md-2 "></div>
		<div class="col-md-8 ">
			<div align="right">
				<span style="color: red; margin-right: 1%">*추가적인 사진과 정보를
					입력하세요!</span> <input type="button" class="btn btn-warning  btn-lg" value="추가 사진 등록"
					style="margin-right: 1%"> <input type="submit"
					class="btn btn-warning btn-lg" value="등록" style="margin-right: 1% ">
			</div>
			<form role="form">
				<div class="form-login " style="margin-bottom: 2%;">
					<h3 align="center" style="margin-bottm: 1%">레시피 등록</h3>
					<div style="margin-top: 1%">
						<label for="title"
							style="color: red; font-size: x-large; margin: 1%">*제목</label><input
							type="email" class="form-control" id="email"
							placeholder="제목을 입려하세요">
					</div>
					<div style="margin-top: 1%">
						<label for="mainImage"
							style="color: red; font-size: x-large; margin: 1%">*메인 사진</label><br />
						<div class="media">
							<div class="media-left">
								<img class="media-object img-rounded"
									src="../img/images3.jpg" alt="..." id="fileUpload">
							</div>
							<div id="fileUploadProgress" ></div>
							<div style="margin-top: 1%">
								<input type="button" class="btn btn-warning" value="메인 사진 등록">
							</div>
							<div style="margin: 1%">
								<label style="color: red; font-size: x-large;">*재료 입력</label>
								예) 당근(1개),시금치(100g),빵(조금)
							</div>
							<div>
								<textarea class="form-control" rows="3" placeholder="재료를 입력하세요"></textarea>
							</div>
							<div style="margin: 1%">
								<label style="color: red; font-size: x-large;">*간단한 설명</label>
							</div>
							<div>
								<textarea class="form-control" rows="10"
									placeholder="간단한 설명을 적어주세요"></textarea>
							</div>
							<div style="margin: 1%">
								<label style="color: red; font-size: x-large;">*Tip</label>
							</div>
							<div>
								<textarea class="form-control" rows="3"
									placeholder="Tip을 적어주세요"></textarea>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="insertDetailImg.jsp"></jsp:include>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</BODY>
</HTML>