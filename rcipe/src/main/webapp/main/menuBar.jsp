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
	/* $(document).ready(function(){
		$("#dLabel").mouseover(function(){
			$(this).css("background-color","white");
			$(this).css("border-color","white");
		})
		$("#dLabel").mouseout(function(){
			$(this).css("background-color","#FF9933");
			$(this).css("border-color","#FF9933");
		})
	}) */
</script>
<!-- login.jsp :로그인 모달을 가지고 있는 jsp파일 -->
<jsp:include page="/user/login.jsp"></jsp:include>
<jsp:include page="/user/join.jsp"></jsp:include>
<jsp:include page="/main/searchIngredient.jsp"></jsp:include>
<nav id="filp" class="navbar navbar-inverse "
	style="border: none; width: 100%; height: 30%; padding: 10px; text-align: center; background-color: #75DDFF;">
	<div class="row">
		<div class="col-md-2">
			<!-- <div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-5" align="center">
				</div>
				<div class="col-md-5">
					<div class="dropdown"> -->
					<img id="dLabel" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						src="${pageContext.servletContext.contextPath }/images/ingredientIcon.jpg"
						class="img-rounded" role="button"
						style="width: 100px; height: 100px;background-color: #D7D7D7">
						<!-- <button id="dLabel" data-toggle="dropdown" aria-haspopup="true" class="btn btn-default" 
							aria-expanded="false" style="font-size: 2em; background-color:#75DDFF;border-color:#75DDFF; font-family:cursive; color: black">
							Menu <span class="caret"></span>
						</button> -->
						<div class="dropdown-menu dropdown-menu-left" role="menu"
							aria-labelledby="dLabel" style="border: none;margin-top:1%">
							<div id="panel">
								<span class="row" style="float: left"> <span
									class="test " style="padding: 2px; border: none;">
										<ul>
											<h3>육류</h3>
										</ul>
										<ul>
											<li id="checklist"><input type="checkbox"
												name="checkbox1" id="checkbox1" class="css-checkbox"
												value="닭" /><label for="checkbox1" class="css-label">닭</label></li>
											<li id="checklist"><input type="checkbox"
												name="checkbox2" id="checkbox2" class="css-checkbox"
												value="돼지" /><label for="checkbox2" class="css-label">돼지</label></li>
											<li id="checklist"><input type="checkbox"
												name="checkbox3" id="checkbox3" class="css-checkbox"
												value="소" /><label for="checkbox3" class="css-label">소</label></li>
										</ul>
								</span> <span class="test " style="padding: 2px; border: none;">
										<ul>
											<h3>야채류</h3>
										</ul>
										<ul>
											<li id="checklist"><input type="checkbox"
												name="checkbox4" id="checkbox4" class="css-checkbox"
												value="배추" /><label for="checkbox4" class="css-label">배추</label></li>
											<li id="checklist"><input type="checkbox"
												name="checkbox5" id="checkbox5" class="css-checkbox"
												value="양파" /><label for="checkbox5" class="css-label">양파</label></li>
											<li id="checklist"><input type="checkbox"
												name="checkbox6" id="checkbox6" class="css-checkbox"
												value="무" /><label for="checkbox6" class="css-label">무</label></li>
										</ul>
								</span> <span class="test " style="padding: 2px; border: none;">
										<ul>
											<h3>생선류</h3>
										</ul>
										<ul>
											<li id="checklist"><input type="checkbox"
												name="checkbox7" id="checkbox7" class="css-checkbox"
												value="고등어" /><label for="checkbox7" class="css-label">고등어</label></li>
											<li id="checklist"><input type="checkbox"
												name="checkbox8" id="checkbox8" class="css-checkbox"
												value="강치" /><label for="checkbox8" class="css-label">강치</label></li>
											<li id="checklist"><input type="checkbox"
												name="checkbox9" id="checkbox9" class="css-checkbox"
												value="명태" /><label for="checkbox9" class="css-label">명태</label></li>
										</ul>
								</span> <span class="test " style="padding: 2px; border: none;">
										<ul>
											<h3>가공식품</h3>
										</ul>
										<ul>
											<li id="checklist"><input type="checkbox"
												name="checkbox10" id="checkbox10" class="css-checkbox"
												value="절임" /><label for="checkbox10" class="css-label">절임</label></li>
											<li id="checklist"><input type="checkbox"
												name="checkbox11" id="checkbox11" class="css-checkbox"
												value="통조림" /><label for="checkbox11" class="css-label">통조림</label></li>
											<li id="checklist"><input type="checkbox"
												name="checkbox12" id="checkbox12" class="css-checkbox"
												value="건조" /><label for="checkbox12" class="css-label">건조</label></li>
										</ul>
								</span>
								</span>
								<div align="right">
									<button type="button" class="btn btn-default"
										style="margin-right: 2%" data-target="#searchIngredient"
										data-whatever="dialog" data-toggle="modal"
										data-backdrop="false">
										<a>상세검색</a>
									</button>
								</div>
							</div>
						</div>
					</div>
				<!-- </div>
			</div>
		</div> -->

		<div class="col-md-8" style="margin-top: 1%;">
			<form method="GET" name="searchForm" id="searchForm"
				action="${pageContext.servletContext.contextPath }/app/recipe/getRecipeList">
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-10 " align="center"
						style="display: inline-block; text-align: center;margin-top:-2%">
						<div id="imaginary_container">
						<a href="${pageContext.servletContext.contextPath}/index.jsp" 
							><button id="homeButton" class="btn btn-default" style="font-size: 2em; font-family:cursive; color: black;background-color:#75DDFF;
							border-color:#75DDFF;">Rcipe</button></a>
							<span class="input-group stylish-input-group"> <input
								type="hidden" name="searchCategory" value="inquiry " /> <input
								type="text" value="${search.searchKeyword}" class="form-control"
								placeholder="Search" id="searchKeyword" name="searchKeyword"
								URIEncoding="UTF-8"> <span class="input-group-addon">
									<button type="submit">
										<span class="glyphicon glyphicon-search"></span>
									</button>
							</span>
							</span>
						</div>
					</div>
					<div class="col-sm-1 "></div>
				</div>
			</form>
		</div>

		<div class="col-md-2">
			<span class="dropdown dropdown-toggle"> <c:if
					test="${user.userImage == null }">
					<img
						src="${pageContext.servletContext.contextPath }/images/userIcon.png"
						class="img-circle" role="button"
						style="width: 100px; height:100px; margin-top: 1%;background-color: #D7D7D7"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				</c:if> <c:if test="${user.userImage != null }">
					<img
						src="${pageContext.servletContext.contextPath }/images/${user.userImage}"
						class="img-circle" role="button"
						style="width: 100px; height: 100px;background-color: #D7D7D7" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
				</c:if>
				<div
					class="dropdown-menu  dropdown-menu-right "
					aria-labelledby="user-div-image" style="border: none;margin-top:45%" role="menu">
					<c:if test="${user.nickname == null }">
						<li><a href="#" class="btn" data-toggle="modal"
							data-target="#loginModal" data-whatever="Login"
							data-backdrop="false" style="color: black">로그인</a></li>
						<li><a href="#" class="btn" data-toggle="modal"
							data-target="#joinModal" data-whatever="Join"
							data-backdrop="false" style="color: black">회원가입</a></li>
						<div align="center">
							<li><a
								href="${pageContext.servletContext.contextPath }/app/board/getBoardListFirst?searchCategory=0"
								class="btn " style="color: black">게시판리스트</a></li>
						</div>
					</c:if>
					<c:if test="${user.nickname != null }">
						<li><a
							href="${pageContext.servletContext.contextPath }/app/user/userLogout"
							class="btn " style="color: black">로그아웃</a></li>
						<div align="center">
							<div align="center">
								<li><a
									href="${pageContext.servletContext.contextPath }/app/board/getBoardListFirst?searchCategory=0"
									class="btn " style="color: black">게시판리스트</a></li>
							</div>
							<li><a
								href="${pageContext.servletContext.contextPath }/app/recipe/viewInsertRecipe"
								class="btn " style="color: black">레시피등록</a></li>
						</div>
						<div align="center">
							<li><a
								href="${pageContext.servletContext.contextPath }/app/favorite/getfavoriteList"
								class="btn " style="color: black">즐겨찾기</a></li>
						</div>
						<div align="center">
							<li><a
								href="${pageContext.servletContext.contextPath }/app/user/viewUser"
								class="btn " style="color: black">내정보보기</a></li>
						</div>
					</c:if>
				</div>
			</span>
		</div>
	</div>
</nav>
