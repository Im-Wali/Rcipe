<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<HEAD>
<title>Recipe</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet"
	href="../../css/bootstrap.min.css">
<script
	src="../../js/jquery-1.11.3.min.js"></script>
<script
	src="../../js/bootstrap.min.js"></script> -->
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
<script type="text/javascript">
	$(document).ready(function() {
			//!!!!!!!!!!!!!!!!!!!!!바꿔야함	
			/* function add_content() {
				location.href("insertBoard.jsp");
			} */
			$('#select_category').html("카테고리");
			var n = $('#category').val();
			var str;
			if (n == 1) {
				str = "레시피";
			} else if (n == 2) {
				str = "추천맛집";
			} else if (n == 3) {
				str = "고민상담";
			} else {
				str = "기타";
			}
			$('#select_category').html(str); 
	});
</script>
</HEAD>
<body>
	<div><jsp:include page="/main/menuBar.jsp"></jsp:include></div>
	<div class="row" style="margin-top: 4%; text-align: left;">
		<div class="col-md-2 "></div>
		<div class="col-md-8 ">
			<div align="right">
				<input type="hidden" id="boardNo" value="${board.boardNo }">
				<input type="hidden" id="category" value="${board.boardCategory }">
				<span style="float: left"> <label for="title"
					style="color: black; font-size: medium;">작성자 :
						${board.nickname } / 조회수 : (${board.boardCount })</label></span><span> <label
					for="title" style="color: black; font-size: medium;">작성일
						:${board.boardDate } </label>
				</span>
			</div>
			<div class="form-login " style="margin-bottom: 2%;" align="right">
				<h2 align="center" style="margin-bottm: 1%; color: red;">게시판글
					보기</h2>
				<div style="margin-top: 1%">
					<div class="btn-group" style="margin: 1%;">
						<span>
							<button type="button" class="btn btn-warning"
								id="select_category" style="margin: 1%;">
								<span class="caret"></span>
							</button>
						</span>
					</div>
					<div align="left">
						<label for="title" style="color: black; font-size: medium;">제목</label>
					</div>
					<div class="form-login "
						style="margin: 1%; background-color: white;" align="left">${board.boardTitle }</div>
					<!-- Single button -->
					<div align="left">
						<label for="title" style="color: black; font-size: medium;">내용</label>
						<div class="form-login "
							style="margin: 1%; background-color: white;">
							${board.boardContent }</div>
					</div>
					<div align="right" style="margin: 1%">
						<a href="#">
							<button type='button' class="btn btn-warning ">목록보기</button>
						</a>
						<c:if test="${board.nickname eq user.nickname }">
							<a href="viewModifyBoard?boardNo=${board.boardNo}">
								<button type="button" class="btn btn-warning ">수정하기</button>
							</a>
							<a
								href="deleteBoard?boardNo=${board.boardNo}&boardImgPath=/${board.nickname}/${board.boardImgPath}">
								<button type="button" class="btn btn-warning">게시글 삭제</button>
							</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2 "></div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="form-login " style="margin-bottom: 2%;">
				<jsp:include page="/comment/comment.jsp"></jsp:include>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>
</html>