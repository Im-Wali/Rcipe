<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
  href="${pageContext.servletContext.contextPath }/css/cardSession.css">
<script>
	$(document).ready(function() {
	});
</script>

<div class="row"
	style="margin-top: 1%; margin-left: 2px; display: inline-block; text-align: center; width: 100%;">
	<c:choose>
		<c:when test="${ search.searchCategory eq null }">
			<div class="col-md-1"></div>
		</c:when>
		<c:otherwise>
			<div></div>
		</c:otherwise>
	</c:choose>

	<div
		class="
	<c:choose>
  <c:when test="${ search.searchCategory eq null }" >
  col-md-10
  </c:when>
<c:otherwise>
</c:otherwise>  
  </c:choose>
	"
		style="display: inline-block; text-align: center;">

		<section>
			<ul id="gallery">
        
        <c:choose>
        <c:when test="${ list eq null }" ><div><h4>검색된 결과가 없습니다.</h4></div></c:when>
        <c:otherwise>
        
        
				<c:forEach var="recipe" items="${ list }">

					<li><a
						href="${pageContext.servletContext.contextPath }/app/recipe/viewRecipe?recipeNo=${recipe.recipeNo}"></a>
						<img class="lazy"
						src="${pageContext.servletContext.contextPath }/images/${recipe.titleImage}"
						width="240" height="200" style="display: inline;">
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
						</div></li>
				</c:forEach>
</c:otherwise>
        </c:choose>
			</ul>
		</section>
		<!-- cardSerction 끝 -->
	</div>
	
	<c:choose>
		<c:when test="${ search.searchCategory eq null }">
			<div class="col-md-1"></div>
		</c:when>
		<c:otherwise>
			<div></div>
		</c:otherwise>
	</c:choose>

</div>
