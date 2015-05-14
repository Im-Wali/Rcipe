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
	function selectCategory(value) {
		document.getElementById("select_category").innerHTML = value;
		document.getElementById("selectCartegory").val = value;
	};
</script>
</HEAD>
<body>
	<jsp:include page="menuBar.jsp"></jsp:include>
	<div class="row" style="margin-top: 4%; text-align: left;">
		<div class="col-md-2 "></div>
		<div class="col-md-8 ">
			<form action="#" method="POST">
				<div class="form-login " style="margin-bottom: 2%;">
					<h3 align="center" style="margin-bottm: 1%">게시판글 등록</h3>
					<div style="margin-top: 1%">
						<label for="title"
							style="color: red; font-size: x-large; margin: 1%">*제목</label><input
							type="email" class="form-control" id="email"
							placeholder="제목을 입려하세요">
						<!-- Single button -->
						<div class="btn-group" style="margin:1%;margin-top: 3%; float: right">
							<input type="hidden" id="selectCartegory" vlaue="기타"> <span>
								<button type="button" class="btn btn-warning">사진첨부</button>
							</span> <span>
								<button type="button" class="btn btn-warning dropdown-toggle "
									data-toggle="dropdown" aria-expanded="false" style="size:">
									<span id="select_category">카테고리</span> <span class="caret">
									</span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a onclick="javascript:selectCategory('레시피')">레시피</a></li>
									<li><a onclick="javascript:selectCategory('추천맛집')">추천맛집</a></li>
									<li><a id="search_contents_nickname"
										onclick="javascript:selectCategory('고민상담')">고민상담</a></li>
									<li><a id="search_contents_nickname"
										onclick="javascript:selectCategory('기타')">기타</a></li>
								</ul>
							</span>
						</div>
						<div style="margin-top: 1%">
							<label style="color: red; font-size: x-large; margin: 1%">*게시판글
								내용입력</label>
						</div>
						<div>
							<textarea class="form-control" rows="40"
								placeholder="게시판글을 작성해주세요."></textarea>
						</div>
						<div align="right" style="margin-top:1%">
							<span><button type="submit" class="btn btn-warning">등록</button></span>
							<span><button type="reset" class="btn btn-warning">취소</button></span>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-2 "></div>
	</div>
</body>
</HEAD>