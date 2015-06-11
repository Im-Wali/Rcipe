<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<title>Recipe</title>
<style type="text/css">
.glyphicon {
	margin-right: 5px;
}

.section-box h2 {
	margin-top: 0px;
}

.section-box h2 a {
	font-size: 15px;
}

.glyphicon-heart {
	color: #e74c3c;
}

.glyphicon-comment {
	color: #27ae60;
}

.separator {
	padding-right: 5px;
	padding-left: 5px;
}

.section-box hr {
	margin-top: 0;
	margin-bottom: 5px;
	border: 0;
	border-top: 1px solid rgb(199, 199, 199);
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
</style>
</head>
<body>
	<div><jsp:include page="../main/menuBar.jsp"></jsp:include></div>
	<div class="container">
		<div align="center" style="margin-top:2%;margin-bottom:4%">
			<h1>즐겨찾기목록</h1>
		</div>
		<div class="form-login " style="margin-bottom: 2%;">
			<div class="row">
			
			
				<c:forEach var="favorite" items="${ list }">
				
<div class="col-md-6">
          <div class="well well-sm">
            <div class="row">
              <div class="col-xs-3 col-md-3 text-center">
                <a href="${pageContext.servletContext.contextPath }/app/recipe/viewRecipe?recipeNo=${favorite.recipeNo}"><img src=" ${ favorite.recipe.titleImage }"
                  alt="bootsnipp"
                  style="width: 114px; height: 114px; position: absolute;"
                  class="img-rounded img-responsive" /></a>
              </div>

              <div class="col-xs-9 col-md-9 section-box">
                <a href="${pageContext.servletContext.contextPath }/app/recipe/viewRecipe?recipeNo=${favorite.recipeNo}" style="color: black"><h2>${ favorite.favorTitle }</h2></a>
                <div align="right">
                 ${ favorite.recipe.recipeContents }
                  <button type="button" class="btn btn-warning">즐겨찾기 삭제</button>
                  <button type="button" class="btn btn-warning">수정</button>
                </div>
                <hr />
                <div class="row rating-desc">
                  <div class="col-md-12">
                    <span class="glyphicon glyphicon-heart"></span><span
                      class="glyphicon glyphicon-heart"> </span><span
                      class="glyphicon glyphicon-heart"></span><span
                      class="glyphicon glyphicon-heart"> </span><span
                      class="glyphicon glyphicon-heart"></span>(36)<span
                      class="separator">|</span> <span
                      class="glyphicon glyphicon-comment"></span>(${ favorite.cmtCnt } Comments)
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

</c:forEach>
				
				
			</div>
		</div>
	</div>
</body>
</html>