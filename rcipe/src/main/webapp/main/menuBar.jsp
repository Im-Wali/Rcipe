<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/menuBar01.css"
	type="text/css" />
<script src="${pageContext.servletContext.contextPath }/js/menuBar01.js">
	
</script>
<script type="text/javascript">
	function search() {
		/* 	var searchKeyword = document.getElementById("searchKeyword").value;
			location.href = 'http://localhost:8080/rcipe/app/recipe/getRecipeList?searchKeyword='
					+ searchKeyword; */
	}
</script>
<!-- login.jsp :로그인 모달을 가지고 있는 jsp파일 -->
<jsp:include page="/user/login.jsp"></jsp:include>
<jsp:include page="/user/join.jsp"></jsp:include>
<jsp:include page="/main/searchIngredient.jsp"></jsp:include>
<nav id="filp" class="navbar navbar-inverse "
	style="border: none; width: 100%; height: 30%; padding: 10px; text-align: center; background-color: #FF9933;">
	<span style="float: left; padding-left: 10px; margin-top: 1%"><a
		href="${pageContext.servletContext.contextPath}"
		style="font-size: 2em; color: black">Rcipe</a></span>
	<div class="dropdown">
		<div id="dLabel" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"
			style="float: left; padding-left: 20px; font-size: 2em; margin-top: 1%; color: black">
			Menu <span class="caret"></span>
		</div>
		<ul class="dropdown-menu dropdown-menu-main" role="menu"
			aria-labelledby="dLabel"
			style="margin: 75px; background-color: #FF9933; border: none;">
			<div id="panel">
				<div class="test" style="padding: 2px; float: left; border: none;">
					<ul>
						<h3>육류</h3>
					</ul>
					<ul>
						<li id="checklist"><input type="checkbox" name="checkbox1"
							id="checkbox1" class="css-checkbox" value="닭" /><label
							for="checkbox1" class="css-label">닭</label></li>
						<li id="checklist"><input type="checkbox" name="checkbox2"
							id="checkbox2" class="css-checkbox" value="돼지" /><label
							for="checkbox2" class="css-label">돼지</label></li>
						<li id="checklist"><input type="checkbox" name="checkbox3"
							id="checkbox3" class="css-checkbox" value="소" /><label
							for="checkbox3" class="css-label">소</label></li>
					</ul>
				</div>
				<div class="test" style="padding: 2px; float: left; border: none;">
					<ul>
						<h3>야채류</h3>
					</ul>
					<ul>
						<li id="checklist"><input type="checkbox" name="checkbox4"
							id="checkbox4" class="css-checkbox" value="배추" /><label
							for="checkbox4" class="css-label">배추</label></li>
						<li id="checklist"><input type="checkbox" name="checkbox5"
							id="checkbox5" class="css-checkbox" value="양파" /><label
							for="checkbox5" class="css-label">양파</label></li>
						<li id="checklist"><input type="checkbox" name="checkbox6"
							id="checkbox6" class="css-checkbox" value="무" /><label
							for="checkbox6" class="css-label">무</label></li>
					</ul>
				</div>
				<div class="test" style="padding: 2px; float: left; border: none;">
					<ul>
						<h3>생선류</h3>
					</ul>
					<ul>
						<li id="checklist"><input type="checkbox" name="checkbox7"
							id="checkbox7" class="css-checkbox" value="고등어" /><label
							for="checkbox7" class="css-label">고등어</label></li>
						<li id="checklist"><input type="checkbox" name="checkbox8"
							id="checkbox8" class="css-checkbox" value="강치" /><label
							for="checkbox8" class="css-label">강치</label></li>
						<li id="checklist"><input type="checkbox" name="checkbox9"
							id="checkbox9" class="css-checkbox" value="명태" /><label
							for="checkbox9" class="css-label">명태</label></li>
					</ul>
				</div>
				<div class="test" style="padding: 2px; float: left; border: none;">
					<ul>
						<h3>가공식품</h3>
					</ul>
					<ul>
						<li id="checklist"><input type="checkbox" name="checkbox10"
							id="checkbox10" class="css-checkbox" value="절임" /><label
							for="checkbox10" class="css-label">절임</label></li>
						<li id="checklist"><input type="checkbox" name="checkbox11"
							id="checkbox11" class="css-checkbox" value="통조림" /><label
							for="checkbox11" class="css-label">통조림</label></li>
						<li id="checklist"><input type="checkbox" name="checkbox12"
							id="checkbox12" class="css-checkbox" value="건조" /><label
							for="checkbox12" class="css-label">건조</label></li>
					</ul>
				</div>
				<div align="right">
					<button type="button" class="btn btn-default"
						style="margin-right: 2%" data-target="#searchIngredient"
						data-whatever="dialog" data-toggle="modal" data-backdrop="false">
						<a>상세검색</a>
					</button>
				</div>
			</div>
		</ul>
	</div>
	<div align="right" style="padding-right: 10px; margin-top: 1%">
		<form method="GET" name="searchForm" id="searchForm"
			action="${pageContext.servletContext.contextPath }/app/recipe/getRecipeList">
			<span class="row"> <span class="col-sm-5 col-sm-offset-2"
				style="display: inline-block; text-align: center; margin-top: 1%;">
					<span id="imaginary_container"> <span
						class="input-group stylish-input-group"> <input type="text"
							value="${search.searchKeyword}" class="form-control"
							placeholder="Search" id="searchKeyword" name="searchKeyword"
							URIEncoding="UTF-8"> <span class="input-group-addon">
								<button type="submit">
									<span class="glyphicon glyphicon-search"></span>
								</button>
						</span>
					</span>
				</span>
			</span>
			</span>
		</form>
		<span class="dropdown dropdown-toggle"> <c:if
				test="${user.userImage == null }">
				<img
					src="${pageContext.servletContext.contextPath }/images/userIcon.png"
					class="img-circle" role="button"
					style="width: 80px; height: 80px; margin-right: 1%; margin-top: -2%"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			</c:if> <c:if test="${user.userImage != null }">
				<img
					src="${pageContext.servletContext.contextPath }/images/${user.userImage}"
					class="img-circle" role="button"
					style="width: 80px; height: 80px; margin-right: 1%; margin-top: -2%"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			</c:if>
			<ul class="dropdown-menu dropdown-menu-right "
				aria-labelledby="user-div-image"
				style="margin-top: 20px; background-color: #FF9933; border: none;"
				role="menu">
				<c:if test="${user.nickname == null }">
					<li><a href="#" class="btn btn-primary" data-toggle="modal"
						data-target="#loginModal" data-whatever="Login"
						data-backdrop="false"
						style="background-color: #FF9933; border: #FF9933; color: black">로그인</a></li>
					<li><a href="#" class="btn btn-primary" data-toggle="modal"
						data-target="#joinModal" data-whatever="Join"
						data-backdrop="false"
						style="background-color: #FF9933; border: #FF9933; color: black">회원가입</a></li>
					<div align="center">
						<li><a
							href="${pageContext.servletContext.contextPath }/app/board/getBoardListFirst?searchCategory=0"
							class="btn btn-primary"
							style="background-color: #FF9933; border: #FF9933; color: black">게시판리스트</a></li>
					</div>
				</c:if>
				<c:if test="${user.nickname != null }">
					<li><a
						href="${pageContext.servletContext.contextPath }/app/user/userLogout"
						class="btn btn-primary"
						style="background-color: #FF9933; border: #FF9933; color: black">로그아웃</a></li>
					<div align="center">
						<div align="center">
							<li><a
								href="${pageContext.servletContext.contextPath }/app/board/getBoardListFirst?searchCategory=0"
								class="btn btn-primary"
								style="background-color: #FF9933; border: #FF9933; color: black">게시판리스트</a></li>
						</div>
						<li><a
							href="${pageContext.servletContext.contextPath }/app/recipe/viewInsertRecipe"
							class="btn btn-primary"
							style="background-color: #FF9933; border: #FF9933; color: black">레시피등록</a></li>
					</div>
					<div align="center">
						<li><a
							href="${pageContext.servletContext.contextPath }/app/favorite/getfavoriteList"
							class="btn btn-primary"
							style="background-color: #FF9933; border: #FF9933; color: black">즐겨찾기</a></li>
					</div>
					<div align="center">
						<li><a
							href="${pageContext.servletContext.contextPath }/app/user/viewUser"
							class="btn btn-primary"
							style="background-color: #FF9933; border: #FF9933; color: black">내정보보기</a></li>
					</div>
				</c:if>


			</ul>
		</span>
	</div>
</nav>
