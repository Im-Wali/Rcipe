<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- id searchBoard에 전체검색,제목,작성자 0,1,2식으로 저장-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</head>
<body>
	<jsp:include page="menuBar.jsp"></jsp:include>
	<div class="row" style="margin-top: 4%; text-align: right;">
		<div class="col-md-2 "></div>
		<div class="col-md-8 " style="height: 1000px">
			<div align="center" style="margin-bottom:2%">
				<h2>게시판목록</h2>
			</div>
			<div class="form-login " style="margin-bottom: 2%; height: 900px">
				<!-- 검색폼  -->
				<form name="searchform" action="" method="get">
					<div class="row">
						<span class="col-sm-4 col-sm-offset-8"
							style="display: inline-block; text-align: center; margin-top: 1%;">
							<span id="imaginary_container"> <span
								class="input-group stylish-input-group"> <input
									type="hidden" id="searchBoard" value="0">
									<div class="input-group-btn search-panel"
										style="background-color: white">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown">
											<span id="search_contents">전체검색</span> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a id="search_contents_recipe"
												onclick="javascript:searchContentsResulver('전체검색',0)">전체검색</a></li>
											<li><a id="search_contents_nickname"
												onclick="javascript:searchContentsResulver('제목',1)"> 제목</a></li>
											<li><a id="search_contents_recipe"
												onclick="javascript:searchContentsResulver('작성자',2)">작성자</a></li>
											<li><a id="search_contents_nickname"
												onclick="javascript:searchContentsResulver('내용',3)">내용</a></li>
										</ul>
									</div> <input type="text" class="form-control" placeholder="Search"
									id="inputsearch"> <span class="input-group-addon">
										<button type="submit">
											<span class="glyphicon glyphicon-search"></span>
										</button>
								</span>
							</span>
						</span>
					</div>
				</form>
				<div class="row" style="margin-top: 4%; text-align: left;">
					<div class="col-md-2">게시판번호</div>
					<div class="col-md-4">제목</div>
					<div class="col-md-2">작성자</div>
					<div class="col-md-2">등록일자</div>
					<div class="col-md-2">카테고리</div>
				</div>

				<div class="form-login "
					style="margin-bottom: 2%; margin-top: 1%; background-color: white;">
					<div class="form-login" style="background-color:#EEEEEE; margin-bottom:1%;margin-left:-1%;margin-right:-1%;">
						<div class="row" style="text-align: left; font-size: 1.2em">
							<div class="col-md-2">1000</div>
							<div class="col-md-4">
								<a href="viewBoard.jsp" style="color: black">오징어손질</a>
							</div>
							<div class="col-md-2">마마보이</div>
							<div class="col-md-2">2015/5/5</div>
							<div class="col-md-2">전체</div>
						</div>
					</div>
					<div class="form-login" style="background-color:#EEEEEE; margin-bottom:1%;margin-left:-1%;margin-right:-1%;">
						<div class="row" style="text-align: left; font-size: 1.2em">
							<div class="col-md-2">1000</div>
							<div class="col-md-4">
								<a href="viewBoard.jsp" style="color: black">오징어손질</a>
							</div>
							<div class="col-md-2">마마보이</div>
							<div class="col-md-2">2015/5/5</div>
							<div class="col-md-2">전체</div>
						</div>
					</div>
					<div class="form-login" style="background-color:#EEEEEE; margin-bottom:1%;margin-left:-1%;margin-right:-1%;">
						<div class="row" style="text-align: left; font-size: 1.2em">
							<div class="col-md-2">1000</div>
							<div class="col-md-4">
								<a href="viewBoard.jsp" style="color: black">오징어손질</a>
							</div>
							<div class="col-md-2">마마보이</div>
							<div class="col-md-2">2015/5/5</div>
							<div class="col-md-2">전체</div>
						</div>
					</div>
					<div class="form-login" style="background-color:#EEEEEE; margin-bottom:1%;margin-left:-1%;margin-right:-1%;">
						<div class="row" style="text-align: left; font-size: 1.2em">
							<div class="col-md-2">1000</div>
							<div class="col-md-4">
								<a href="viewBoard.jsp" style="color: black">오징어손질</a>
							</div>
							<div class="col-md-2">마마보이</div>
							<div class="col-md-2">2015/5/5</div>
							<div class="col-md-2">전체</div>
						</div>
					</div>
					<div class="form-login" style="background-color:#EEEEEE; margin-bottom:1%;margin-left:-1%;margin-right:-1%;">
						<div class="row" style="text-align: left; font-size: 1.2em">
							<div class="col-md-2">1000</div>
							<div class="col-md-4">
								<a href="viewBoard.jsp" style="color: black">오징어손질</a>
							</div>
							<div class="col-md-2">마마보이</div>
							<div class="col-md-2">2015/5/5</div>
							<div class="col-md-2">전체</div>
						</div>
					</div>
					<div class="form-login" style="background-color:#EEEEEE; margin-bottom:1%;margin-left:-1%;margin-right:-1%;">
						<div class="row" style="text-align: left; font-size: 1.2em">
							<div class="col-md-2">1000</div>
							<div class="col-md-4">
								<a href="viewBoard.jsp" style="color: black">오징어손질</a>
							</div>
							<div class="col-md-2">마마보이</div>
							<div class="col-md-2">2015/5/5</div>
							<div class="col-md-2">전체</div>
						</div>
					</div>
					<div class="form-login" style="background-color:#EEEEEE; margin-bottom:1%;margin-left:-1%;margin-right:-1%;">
						<div class="row" style="text-align: left; font-size: 1.2em">
							<div class="col-md-2">1000</div>
							<div class="col-md-4">
								<a href="viewBoard.jsp" style="color: black">오징어손질</a>
							</div>
							<div class="col-md-2">마마보이</div>
							<div class="col-md-2">2015/5/5</div>
							<div class="col-md-2">전체</div>
						</div>
					</div>
					<div class="form-login" style="background-color:#EEEEEE; margin-bottom:1%;margin-left:-1%;margin-right:-1%;">
						<div class="row" style="text-align: left; font-size: 1.2em">
							<div class="col-md-2">1000</div>
							<div class="col-md-4">
								<a href="viewBoard.jsp" style="color: black">오징어손질</a>
							</div>
							<div class="col-md-2">마마보이</div>
							<div class="col-md-2">2015/5/5</div>
							<div class="col-md-2">전체</div>
						</div>
					</div>
					<div class="form-login" style="background-color:#EEEEEE; margin-bottom:1%;margin-left:-1%;margin-right:-1%;">
						<div class="row" style="text-align: left; font-size: 1.2em">
							<div class="col-md-2">1000</div>
							<div class="col-md-4">
								<a href="viewBoard.jsp" style="color: black">오징어손질</a>
							</div>
							<div class="col-md-2">마마보이</div>
							<div class="col-md-2">2015/5/5</div>
							<div class="col-md-2">전체</div>
						</div>
					</div>
					<div class="form-login" style="background-color:#EEEEEE; margin-bottom:1%;margin-left:-1%;margin-right:-1%;">
						<div class="row" style="text-align: left; font-size: 1.2em">
							<div class="col-md-2">1000</div>
							<div class="col-md-4">
								<a href="viewBoard.jsp" style="color: black">오징어손질</a>
							</div>
							<div class="col-md-2">마마보이</div>
							<div class="col-md-2">2015/5/5</div>
							<div class="col-md-2">전체</div>
						</div>
					</div>
					<div class="form-login" style="background-color:#EEEEEE; margin-bottom:1%;margin-left:-1%;margin-right:-1%;">
						<div class="row" style="text-align: left; font-size: 1.2em">
							<div class="col-md-2">1000</div>
							<div class="col-md-4">
								<a href="viewBoard.jsp" style="color: black">오징어손질</a>
							</div>
							<div class="col-md-2">마마보이</div>
							<div class="col-md-2">2015/5/5</div>
							<div class="col-md-2">전체</div>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-warning" style="color: black"
					onclick="open('insertBoard.jsp','_self', '','')">글쓰기</button>
			</div>
		</div>
		<div class="col-md-2 "></div>
	</div>
</body>
</html>



