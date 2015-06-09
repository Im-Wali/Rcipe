<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="font-size: 13px">
<head>
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
<link href="${pageContext.servletContext.contextPath}/css/recipe01.css"
	rel="stylesheet">
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
<body
	style="background-color: #fff color: #383838; padding: 0; margin: 0; font-family: Verdana, Arial, sans-serif; font-weight: 400; font-style: normal; line-height: 131%; position: relative; cursor: default">
	<div><jsp:include page="/main/menuBar.jsp"></jsp:include></div>
	<div class="row">
		<input type="hidden" id="recipeNo" name="recipeNo"
			value="${recipe.recipeNo}">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="form-login " align="center"
				style="margin-bottom: 2%; background-color: #000000; color: white">
				<h2>레시피</h2>
			</div>
			<div class="form-login " style="margin-bottom: 2%;">
				<div>
					<div>
						<div align="right" style="font-size: medium;">${recipe.recipeDate}</div>
						<div align="right" style="font-size: medium;">조회수 :
							${recipe.hit}</div>
						<div style="margin-top: 1%" align="center">
							<h2 style="font-size: 4em">${recipe.recipeTitle }</h2>
						</div>
						<%--
						<div class="text-center center-block"
							style="margin-left: 70%; " >
						<jsp:include page="/sns/facebook.jsp"></jsp:include>
						<img id="share_button" src="${pageContext.servletContext.contextPath}/img/twitter.png">
						<img id="share_button" src="${pageContext.servletContext.contextPath}/img/mail.png">
						<img id="share_button" src="${pageContext.servletContext.contextPath}/img/printer.png" height="60" width="60">
						</div>
					</div> --%>
						<div align="center" style="margin-top: 2%">
							<img class="img-rounded"
								src="${pageContext.servletContext.contextPath}/images/${recipe.titleImage}">
						</div>

						<div class="row lead"
							style="margin-top: 2%; margin-bottom: 0%; width: 100%; margin-left: auto; margin-right: auto; margin-top: 0; margin-bottom: 0; max-width: 100rem">
							<div style="margin-top: 1%" align="right">
								현재 평점 <span id="count-existing">${recipe.star/recipe.starHit }</span>
								<span id="stars-existing" class="starrr" id="fixedStar"
									data-rating='${recipe.star/recipe.starHit }'
									style="color: orange;"></span>
							</div>
							<c:if test="${user !=null }">
								<div style="margin-top: 1%" align="right">
									별점 주기 <span id="count">${starRecipe.star}</span> <span
										id="stars" data-rating='${starRecipe.star}' class="starrr"
										style="color: orange;"></span>

								</div>
							</c:if>
							<c:if test="${user ==null }">
								<div style="margin-top: 1%" align="right">
									<span id="stars" data-rating='0' class="starrr"
										style="color: orange;"></span> 별점 주기 <span id="count">0</span>
								</div>
							</c:if>

						</div>
						<div>
							<h3 style="font-size: 3em">간단한 설명</h3>
							<div style="font-size: medium; margin-top: 1%">${recipe.recipeContents }</div>
						</div>
					</div>
					<div class="row"
						style="width: 100%; margin-left: auto; margin-right: auto; margin-top: 0; margin-bottom: 0; max-width: 100rem">
						<div style="margin-bottom: 1%; font-size: medium;">
							<div>
								<h3 style="font-size: 3em">요리재료</h3>
							</div>
							<ul>
								<li style="margin-top: 1%">
									<div>
										<div>${recipe.ingredients}</div>
									</div>
								</li>

							</ul>
						</div>
						<div class="recipeTips" style="margin-top: 1%">
							<h3 style="font-size: 3em">*Tip</h3>
							<ul>
								<li>${recipe.tip }</li>
							</ul>
						</div>
						<!-- 영양정보는 보류 -->
						<!-- <div>
						<div class="h2Left"
							style="font-family: Century Gothic, Arial, Helvetica, sans-serif; font-size: 1.69231rem; color: #383838; line-height: 2rem; text-transform: lowercase; border-bottom: .07692rem solid #eee; margin: .76923rem 0">
							<h4>영양정보</h4>
						</div>
						<span>여기에다가 영양정보를 넣자</span>
						<div>
							<p></p>
						</div>
					</div> -->
					</div>
					<div></div>
				</div>
			</div>
			<div class="form-login " align="center"
				style="margin-bottom: 2%; background-color: #000000; color: white">
				<h2>조리 방법</h2>
			</div>
			<c:set var="i" value="0" />
			<c:forEach var="detail" items="${recipe.detailRecipe}">
				<c:set var="i" value="${ i+1}" />
				<div class="form-login " style="margin-bottom: 2%;">
					<div class="badge" style="height: 10%; width: 10%">${ i}</div>
					<div align="center" style="margin: 4%;">
						<div class="sBlog" style="margin: 1%">
							<img class="img-rounded"
								src="${pageContext.servletContext.contextPath}/images/${detail.detailImage}" />
							<h4 class="brand"
								style="margin: 1%; font: bolder; font-size: 2em;">${i}.
								${detail.detailContents}</h4>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<%-- <div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="form-login " style="margin-bottom: 2%;">
				<jsp:include page="/blog/blog.jsp"></jsp:include>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div> --%>
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
