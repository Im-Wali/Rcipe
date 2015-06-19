<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
  href="../../css/cardSession.css">
<Style>
#checklist {
	list-style-type: none;
}

.containerTap {
	margin: 15px;
}

.panel.with-nav-tabs .panel-heading {
	padding: 5px 5px 0 5px;
	background-color: #75DDFF;
}

.panel.with-nav-tabs .nav-tabs {
	border-bottom: none;
}

.panel.with-nav-tabs .nav-justified {
	margin-bottom: -1px;
}
#pagingfooter a {
  padding: 5px;
}
</Style>
</HEAD>
<BODY>
	<script>
		$("document")
				.ready(
						function() {

							$('li > a').click(function() {
								$('li').removeClass();
								$(this).parent().addClass('active');
							});

							$('#selectList')
									.change(
											function() {
												var e = document
														.getElementById("selectList");
												selectListNum = e.options[e.selectedIndex].value;
												currentCategory = document
														.getElementById("currentCategory").value;
												category(currentCategory);
											});
						});

		var searchKeyword;
		var currentCategory;
		var currentPageNum;
		var selectListNum;

		function fncGetList(currentPage) {
			document.getElementById("currentPage").value = currentPage;
			currentPageNum = currentPage;
			category(currentCategory);

		}
		window.category = function (category) {

			if(currentCategory==category){
				currentPageNum = document.getElementById("currentPage").value;
			}else{
				currentPageNum=1;
			}
			if (typeof category === 'undefined') {
				currentCategory = document.getElementById("currentCategory").value;
			} else {

				if (category != 'inquiry') {
					if (category != 'newest') {
						currentCategory = category.id;
					}
				} else {
					currentCategory = category;
				}
			}
			document.getElementById("currentCategory").value = currentCategory;

			var searchKeyword = document.getElementById("searchKeyword").value;

			if (typeof selectListNum === 'undefined') {
				selectListNum = 10;
			}

			if (typeof currentPageNum === 'undefined') {
				var params = 'searchCategory=' + currentCategory + '&pageSize='
						+ selectListNum+'&searchKeyword='+searchKeyword;
			} else {
				var params = 'searchCategory=' + currentCategory + '&pageSize='
						+ selectListNum + '&currentPage=' + currentPageNum+'&searchKeyword='+searchKeyword;
			}

			$
	        .ajax(
	            "${pageContext.servletContext.contextPath }/app/recipe/getRecipeSearchList",
	            {
	              method : 'get',
	              dataType : 'json',
	              data : params,
	              success : function(result) {

								var resultPage = result.resultPage;
								var search = result.search;
								var list = result.list;
								$("#pagingfooter").empty();

								if (resultPage.currentPage <= resultPage.pageUnit) {
									$("#pagingfooter").append("◀ 이전");
								}
								if (resultPage.currentPage > resultPage.pageUnit) {
									$("#pagingfooter")
											.append(
													"<a href='javascript:fncGetList('"
															+ (resultPage.currentPage - 1)
															+ "')'>◀ 이전</a>");
								}

								for (var i = resultPage.beginUnitPage; i <= resultPage.endUnitPage; i++) {
									$("#pagingfooter").append(
											"<a href='javascript:fncGetList("
													+ i + ");'>" + i + "</a>");
								}

								if (resultPage.endUnitPage >= resultPage.maxPage) {
									$("#pagingfooter").append("이후 ▶");
								}
								if (resultPage.endUnitPage < resultPage.maxPage) {
									$("#pagingfooter")
											.append(
													"<a href='javascript:fncGetList('"
															+ (resultPage.endUnitPage + 1)
															+ "')'>이후 ▶</a>");
								}
								
								var selector = $("#"+result.search.searchCategory);
								if(result.search.searchCategory == 'newest'){
									$("#inquiry").removeClass("active");
									$("#inquiry").removeClass("in");
									$("#newest").addClass("active");
									$("#newest").addClass("in");
								}else{
									$("#newest").removeClass("active");
									$("#newest").removeClass("in");
									$("#inquiry").addClass("active");
									$("#inquiry").addClass("in");
								}
								selector.empty();
								var path=$("#path").val();
								var str = "";
								str += " <div class='row' style='margin-top: 1%; margin-left: 2px; display: inline-block; text-align: center; width: 100%;'>";
								str += " <div style='display: inline-block; text-align: center;'> <section><ul id='gallery'>";
								for (var i = 0; i < list.length; i++) {
									str += " <li ><a href='"
											+ path
											+ "/app/recipe/viewRecipe?recipeNo="
											+ list[i].recipeNo
											+ "'></a>";
									str += " <img class='lazy' src='${pageContext.servletContext.contextPath }/images/"+list[i].titleImage+"' width='240' height='200' style='display: inline;'>";
									str += " <div class='overLayer'></div>";
									str += " <div class='infoLayer'><ul><li><h2>"
											+ list[i].recipeTitle
											+ "</h2></li>";
									str += " <li><p>"
											+ list[i].recipeContents
											+ "</p></li></ul></div></li>";
								}
								str += " </ul></section></div></div>";
								selector.html(str);
	              }
							});

		}
	</script>
	<div><jsp:include page="menuBar.jsp"></jsp:include></div>
	<input type="hidden" id="searchKeyword" name="searchKeyword"
		value="${search.searchKeyword}">
	<input type="hidden" id="currentPage" name="currentPage" value="1" />
	<input type="hidden" id="currentCategory" name="currentCategory"
		value="inquiry" />
	<input type="hidden" id="path" value="${pageContext.servletContext.contextPath }">
	<div class="containerTap">
		<div class="panel with-nav-tabs">
			<div class="panel-heading">
				<ul class="nav nav-tabs">
					<li
						class="<c:if test="${ search.searchCategory.trim() eq 'inquiry' }">active</c:if>"><a
						href="#inquiry" onclick="category(inquiry)" data-toggle="tab" style="color:black;">조회순</a></li>
					<li
						class="<c:if test="${ search.searchCategory.trim() eq 'newest' }">active</c:if>"><a
						href="#recommend" data-toggle="tab" onclick="category(newest)" style="color:black;">최신순</a></li>
					<li style="float: right;">
						<div class="select-style" style="margin-top: 8px;">
							<select id="selectList">
								<option value="10" selected="selected">10</option>
								<option value="20">20</option>
								<option value="50">50</option>
							</select>
						</div>
					</li>
				</ul>
			</div>
			<div class="panel-body">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="inquiry">
						<jsp:include page="cardSession.jsp" />
					</div>
					<div class="tab-pane fade" id="newest"></div>
				</div>
				<div id="pagingfooter" class="pagingfooter"
					style="margin-left: 45%;">
					<jsp:include page="/commons/navigationPage.jsp" />
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/user/login.jsp"></jsp:include>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</BODY>
</HTML>