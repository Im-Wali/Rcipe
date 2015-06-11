<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.servletContext.contextPath }/js/jquery.lazyload.js"></script>

<script>
	$(document).ready(function() {
		$('#gallery').least();
	});
</script>
<style>
ul {
	list-style: none
}

a {
	color: #e94439;
	text-decoration: none
}

a:hover {
	color: #ee6f67;
	text-decoration: underline
}

h2 {
	font-family: Arvo, Arial, sans-serif;
	font-size: 30px;
	line-height: 25px;
	font-weight: 500;
	text-transform: uppercase;
	color: #fff;
	letter-spacing: 1px
}

h1 {
	font-family: Arvo, Arial, sans-serif;
	font-size: 60px;
	line-height: 75px;
	font-weight: 400;
	color: #e94439;
	text-transform: lowercase
}

p {
	font-family: Georgia, Arial, sans-serif;
	font-size: 15px;
	line-height: 15px;
	font-weight: 100;
	color: #fff
}

section {
	min-width: 100%;
	width: 100%;
	min-height: 100%;
	text-align: center;
	padding: 30px 0;
	margin-bottom: 30px;
}

section #fullPreview {
	padding: 50px 0 30px 0;
	display: none
}

section #fullPreview img, section #fullPreview .fullCaption {
	max-width: 960px;
	width: 100%;
	margin: 0 auto;
	display: block
}

section #fullPreview .fullCaption {
	font-family: Helvetica, Arial, sans-serif;
	font-size: 13px;
	line-height: 15px;
	font-weight: 300;
	color: #fff;
	margin: 15px auto 0 auto
}

section #fullPreview figure {
	background-image: url("../img/effects/close.png");
	background-size: 100%;
	width: 30px;
	height: 30px;
	position: absolute;
	top: 10px;
	right: 20px;
	cursor: pointer
}

section li {
	display: inline-block;
	vertical-align: top;
	position: relative
}

section li:hover .overLayer {
	-webkit-transition: opacity 0.3s linear;
	-moz-transition: opacity 0.3s linear;
	-ms-transition: opacity 0.3s linear;
	-o-transition: opacity 0.3s linear;
	transition: opacity 0.3s linear;
	opacity: 0.6;
	display: block;
	background: gray
}

section li:hover .infoLayer {
	-webkit-transition: opacity 0.3s linear;
	-moz-transition: opacity 0.3s linear;
	-ms-transition: opacity 0.3s linear;
	-o-transition: opacity 0.3s linear;
	transition: opacity 0.3s linear;
	opacity: 1;
	display: block;
}

section li a {
	display: block;
	width: 240px;
	height: 200px;
	position: absolute;
	top: 10px;
	left: 0;
	z-index: 6;
}

section li img {
	border: none;
	margin: 10px 10px 0 0
}

section li .overLayer, section li .infoLayer {
	-webkit-transition: opacity 0.3s linear;
	-moz-transition: opacity 0.3s linear;
	-ms-transition: opacity 0.3s linear;
	-o-transition: opacity 0.3s linear;
	transition: opacity 0.3s linear;
	width: 240px;
	height: 200px;
	position: absolute;
	text-align: center;
	opacity: 0;
	top: 10px;
	left: 0;
	z-index: 4
}

section li .overLayer ul, section li .infoLayer ul {
	padding: 50px 0 0 0
}

section li .overLayer ul li, section li .infoLayer ul li {
	display: block;
	margin: 0 auto;
	width: 200px;
	padding: 0 0 5px 0
}

section li .overLayer ul li:first-child, section li .infoLayer ul li:first-child
	{
	border-bottom: 2px #fff solid
}

section li .overLayer ul li:last-child, section li .infoLayer ul li:last-child
	{
	padding: 5px 0 0 0;
	text-transform: lowercase
}

section li .overLayer ul li h2, section li .infoLayer ul li h2 {
	font-size: 25px
}

section li .projectInfo {
	display: none
}
-->
</style>
<div class="row"
	style="margin-top: 2%; display: inline-block; text-align: center;">
	<div class="col-md-1"></div>
	<div class="col-md-10 "
		style="display: inline-block; text-align: center;">
		<section>
			<ul id="gallery">

				<c:forEach var="recipe" items="${ list }">

					<li id="fullPreview"></li>
					<li><a
						href="${pageContext.servletContext.contextPath }/app/recipe/viewRecipe?recipeNo=${recipe.recipeNo}"></a>
						<img src="${pageContext.servletContext.contextPath }/images/${recipe.titleImage}" width="240" height="200"
						style="display: inline;">
						<div class="overLayer"></div>
						<div class="infoLayer">
							<ul>
								<li>
									<h2>${ recipe.recipeTitle }</h2>
								</li>
								<li>
									<p>${ recipe.recipeContents }</p>
								</li>
							</ul>
						</div>
				</c:forEach>

			</ul>
		</section>
		<!-- cardSerction 끝 -->
	</div>
	<div class="col-md-1"></div>
</div>
