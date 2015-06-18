<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- id searchBoard에 전체검색,제목,작성자 0,1,2식으로 저장-->
<script>
<!-- 테스트 추가 -->
 	$(document)
			.ready(
					function() {
											var search = $("#blogSearch").val(); 
											var searchBlog = escape(encodeURIComponent(search));

											$
													.ajax({
														url : "../blog/getBlog",
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
																				"<div class='col-md-3'>"
																				+"<div class='thumbnail live'   style='border-color: black; background: white; width:100%;height:250px'>"
																						+ "<h4><a href='"+list[i].link+"' target='_blank'>"
																						+ list[i].title
																						+ "</a>"
																						+ "</h4><p>"
																						+ list[i].description
																						+ "</p><br>"
																						+ "</div></div>");

															}
														}

													})


					})<!-- 테스트 추가 끝-->
</script>
<input type="hidden" id="blogSearch" value="${recipe.recipeTitle }">
	<div>
		<div style="margin-top: 1%">
			<h2>관련 블로그</h2>
		</div>
		<hr>
				<div id="ref"  class='row' align="center"></div>
		<hr>
	</div>
