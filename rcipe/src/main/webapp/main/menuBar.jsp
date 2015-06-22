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
<jsp:include page="sideMenuBar.jsp"></jsp:include>
<nav id="filp" class="navbar navbar-inverse "
	style="border: none; width: 100%; height: 30%; padding: 10px; text-align: center; background-color: #75DDFF;">
	<div class="row">
		<div class="col-md-2"></div>

		<div class="col-md-8" style="margin-top: 1%;">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-10 " align="center"
					style="display: inline-block; text-align: center; margin-top: -2%">
					<a href="../../index.jsp"><button
							id="homeButton" class="btn btn-default"
							style="font-size: 2.5em; font-family: cursive; color: black; background-color: #75DDFF; border-color: #75DDFF;">Rcipe</button></a>
					<div id="imaginary_container">
						<form method="GET" name="searchForm" id="searchForm"
							action="../recipe/getRecipeList">
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
						</form>
					</div>
				</div>
				<div class="col-sm-1 "></div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>

</nav>
