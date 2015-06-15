<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- id searchBoard에 전체검색,제목,작성자 0,1,2식으로 저장-->
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

<script>
<!-- 테스트 추가 -->
 	$(document)
			.ready(
					function() {
						/* $("#searchBlog").keypress(function(event) {
							if (event.keyCode == 13) {
								event.preventDefault();
								$("#searchBlogbtn").click();
							}
						});  */

// 											alert(${recipe.titleImage});
											$('.test01').remove();

											var search = $("#blogSearch").val(); 
//  											 var search="aaaa"; 

											var searchBlog = escape(encodeURIComponent(search));

											$
													.ajax({
														url : "../app/blog/getBlog",
														dataType : 'json',
														data : "blogTitle="
																+ searchBlog,
														success : function(
																result) {
															var list = result.data;
															$("#ref").empty();
															$("#ref").append();
															for ( var i in list) {
																$("#ref")
																		.append(
																				"<div class='col-md-4'><div  class='thumbnail ' style='border-color: black; background: pink; margin:1%; width:250px;'>"
																						+ "<img src='../img/images.jpg' style='z-index: 0; width: 200px; height: 270px'>"
																						+ "<h4><a href='"+list[i].link+"' target='_blank'>"
																						+ list[i].title
																						+ "</a>"
																						+ "</h4>"
																						+ list[i].description
																						+ "<br>"
																						+ " </div>");

															}
														}

													})


					})<!-- 테스트 추가 끝-->
</script>
	<!--   <body> 추가 -->

<%-- <input type="hidden" id="blogSearch" value="${recipe.recipeTitle }"> --%>
    <input type="hidden" id="blogSearch" value="aaa">

	<!-- <div class="container">

		 <div class="row">
			<div class="col-lg-12">
				<div class="page-header">
					<strong><h1>테스트</h1></strong>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">키워드 입력 후, 검색버튼을 눌러주세요</div>
		</div> 
		<div class="row">
			<br />

			<div class="col-lg-4 col-lg-offset-4">
				<input type="text" name="searchBlog" size="40" id="searchBlog"
					class="userForm-control" tabindex="1" size="10" placeholder="키워드"
					style="margin-right: 40px;" /> <input type="button"
					class="btn btn-default" id="searchBlogbtn" value="검색" />
			</div>
		</div>

		<br />
		<div class="row">
			<div class="col-lg-12"></div>
		</div>

	</div> -->


	<!-- </body> 끝 -->



	<div>
		<div style="margin-top: 1%">
			<h2>관련 블로그</h2>
		</div>
		<hr>
				<!-- 			<div align="center"> -->
				<div id="ref"  class='row' ></div>
				<!-- 	        </div> -->
				
		<hr>
	</div>
