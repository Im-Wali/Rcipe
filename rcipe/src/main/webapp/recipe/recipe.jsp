<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="font-size: 13px">
<meta charset="utf-8">
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<%--   <link href="${pageContext.servletContext.contextPath}/css/recipe01.css"
	rel="stylesheet">  --%>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/js/recipe01.js"></script>

<TITLE>Recipe</TITLE>
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

/*
Ref:
Thanks to:
http://www.jqueryscript.net/layout/Simple-jQuery-Plugin-To-Create-Pinterest-Style-Grid-Layout-Pinterest-Grid.html
*/
body {
	background-color: #eee;
}

#pinBoot {
	position: relative;
	max-width: 100%;
	width: 100%;
}

#pinBoot img {
	width: 100%;
	max-width: 100%;
	height: auto;
}

.white-panel {
	position: absolute;
	background: white;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
	padding: 10px;
}
/*
stylize any heading tags withing white-panel below
*/
.white-panel h1 {
	font-size: 1em;
}

.white-panel h1 a {
	color: #A92733;
}

.white-panel:hover {
	box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.5);
	margin-top: -5px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}
</style>
</head>
<body style="background-color: #fff color: #383838;">
	<div><jsp:include page="/main/menuBar.jsp"></jsp:include></div>
	<jsp:include page="/favorite/favoriteModal.jsp"></jsp:include>
	<jsp:include page="askRecipeRemove.jsp"></jsp:include>
	<div class="row">
		<input type="hidden" id="recipeNo" name="recipeNo"
			value="${recipe.recipeNo}"> <input type="hidden"
			id="imagePath" name="imagePath" value="${recipe.titleImage}">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="form-login " align="center"
				style="margin-bottom: 1.5%; background-color: #75DDFF; color: black">
				<h2 style="font-family: cursive; font-size: 3em">레시피</h2>
			</div>
			<c:if test="${user.nickname eq  recipe.nickname }">
				<div align="right" style="margin-bottom: 1%">
					<span> <a
						href="viewModifyRecipe?recipeNo=${recipe.recipeNo}"><button
								type="button" class="btn btn-primary">레시피 수정</button></a>
					</span>
					<button type="button" class="btn btn-danger" data-toggle="modal"
						data-target="#modifyRecipeRemove" data-backdrop="false"
						data-dismiss="modal">레시피 삭제</button>
				</div>
			</c:if>
			<div class="form-login " style="margin-bottom: 2%;">
				<div>
					<div>
						<div class="row">
							<div class="col-md-6" align="left">
								<span> <jsp:include page="/sns/facebook.jsp"></jsp:include>
									<jsp:include page="/sns/twitter.jsp"></jsp:include> <img
									src="${pageContext.servletContext.contextPath}/images/starIcon2.jpg"
									data-toggle="modal" data-target="#modifyFavoriteAdd"
									data-backdrop="false" data-dismiss="modal" height="55px"
									width="55px" class="img-rounded"
									style="background-color: white; color: orange; cursor: pointer;">
								</span>
							</div>
							<div class="col-md-6">
								<div align="right" style="font-size: large;">작성자:${recipe.nickname}조회수
									: ${recipe.hit}/작성날짜:${recipe.recipeDate}</div>
							</div>
						</div>
						<div style="margin-top: 1%" align="center">
							<p style="font-size: 4em; font-family: cursive;">${recipe.recipeTitle }
							<p>
						</div>
						<%-- <div class="text-center center-block" style="margin-left: 70%;">
							<jsp:include page="/sns/facebook.jsp"></jsp:include>
							<img id="share_button" 
								src="${pageContext.servletContext.contextPath}/img/twitter.png">
							<img id="share_button"
								src="${pageContext.servletContext.contextPath}/img/mail.png">
							<img id="share_button"
								src="${pageContext.servletContext.contextPath}/img/printer.png"
								height="60" width="60">
						</div> --%>
						<div align="center" style="margin-top: 2%">
							<img class="img-rounded"
								style="max-height: 800px; max-height: 800px; min-height: 400px; min-width: 400px"
								src="${pageContext.servletContext.contextPath}/images/${recipe.titleImage}">
						</div>

						<div class="row lead"
							style="margin-top: 2%; margin-bottom: 0%; width: 100%; margin-left: auto; margin-right: auto; margin-top: 0; margin-bottom: 0; max-width: 100rem">
							<div style="margin-top: 1%" align="right">

								<div id="fixedStar" data-rating='${recipe.star/recipe.starHit }'
									style="color: orange; margin-right: 9px; size: 2em">
									<c:forEach begin="1" end="${recipe.star/recipe.starHit}">
										<i class='fa fa-star' style='margin-right: -8px;'></i>
									</c:forEach>
									<c:forEach begin="${recipe.star/recipe.starHit}" end="4">
										<i class='fa fa-star-o' style='margin-right: -8px'></i>
									</c:forEach>
								</div>
								<div id="count-existing">현재 평점:${recipe.starHit!=0 ? (recipe.star/recipe.starHit):0  }개</div>
							</div>
							<c:if test="${user !=null && starRecipe !=null }">
								<div style="margin-top: 1%" align="right">
									<div id="stars" data-rating='${starRecipe.star}' class="starrr"
										style="color: orange; font-family: cursive;"></div>
									<div id="count">현재별점: ${starRecipe.star}개</div>

								</div>
							</c:if>
							<c:if test="${user ==null || starRecipe ==null }">
								<div style="margin-top: 1%" align="right">
									<div id="stars1" data-rating='0' class="starrr"
										style="color: orange; font-family: cursive;"></div>
									<div id="count1">별점 주기</div>
								</div>
							</c:if>

						</div>
					</div>
					<div>
						<div style="margin-bottom: 1%; font-size: medium;" align="center">
							<p style="font-size: 3em; font-family: cursive;">간단한 설명</p>
							<div class="form-login" align="center"
								style="background-color: white;">
								<p style="font-size: 1.6em; margin-top: 2%; font-family: cursive;">${recipe.recipeContents }</p>
							</div>
						</div>
						<div style="margin-bottom: 1%; font-size: medium;" align="center">
							<div align="center">
								<p style="font-size: 3em; font-family: cursive;">요리재료</p>
							</div>
							<div class="form-login" align="center"
								style="background-color: white;">
								<p style="font-size: 1.6em; margin-top: 2%; font-family: cursive;">${recipe.ingredients}</p>
							</div>
						</div>
						<div style="margin-bottom: 1%; font-size: medium;" align="center">
							<p style="font-size: 2.5em; color: red; font-family: cursive;">*Tip</p>
							<div class="form-login" align="center"
								style="background-color: white;">
								<p
									style="font-size: 1.5em; margin-top: 2%; font-family: cursive;">${recipe.tip }</p>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
			<div class="form-login " align="center"
				style="margin-bottom: 1.5%; background-color: #75DDFF; color: black">
				<h2 style="font-family: cursive; font-size: 3em">조리 방법</h2>
			</div>
			<c:set var="i" value="0" />
			<c:forEach var="detail" items="${recipe.detailRecipe}">
				<c:set var="i" value="${ i+1}" />
				<div class="form-login " style="margin-bottom: 2%;">
					<div align="left" class="btn btn-lg disabled " style="font-size:2em;width:2em;cursor:default;background-color:black; color:white  ">${ i}</div>
					<div align="center" style="margin: 4%;">
						<div class="sBlog" style="margin: 1%">
							<img class="img-rounded"
								style="max-height: 800px; max-height: 800px; min-height: 400px; min-width: 400px"
								src="${pageContext.servletContext.contextPath}/images/${detail.detailImage}" />
							<c:if test="${detail.detailContents ne null }">
								<p
									style="font-size: 2.5em;margin-top: 2%; font-family: cursive;">
									${detail.detailContents}</p>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="form-login " style="margin-bottom: 2%;">
				<jsp:include page="/blog/blog.jsp"></jsp:include>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="form-login " style="margin-bottom: 2%;">
				<jsp:include page="/comment/comment.jsp"></jsp:include>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
</body>
</html>
