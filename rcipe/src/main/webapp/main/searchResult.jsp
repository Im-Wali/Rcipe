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
<script
	src="${pageContext.servletContext.contextPath }/js/jquery.lazyload.js"></script>
	<link rel="stylesheet"
  href="${pageContext.servletContext.contextPath }/css/cardSession.css">
<Style>
#checklist {
	list-style-type: none;
}

.containerTap {
	margin: 15px;
}

.panel.with-nav-tabs .panel-heading {
	padding: 5px 5px 0 5px;
}

.panel.with-nav-tabs .nav-tabs {
	border-bottom: none;
}

.panel.with-nav-tabs .nav-justified {
	margin-bottom: -1px;
}
/*** PANEL SUCCESS ***/
.with-nav-tabs.panel-success .nav-tabs>li>a, .with-nav-tabs.panel-success .nav-tabs>li>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>li>a:focus {
	color: #3c763d;
}

.with-nav-tabs.panel-success .nav-tabs>.open>a, .with-nav-tabs.panel-success .nav-tabs>.open>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>.open>a:focus, .with-nav-tabs.panel-success .nav-tabs>li>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>li>a:focus {
	color: #3c763d;
	background-color: #d6e9c6;
	border-color: transparent;
}

.with-nav-tabs.panel-success .nav-tabs>li.active>a, .with-nav-tabs.panel-success .nav-tabs>li.active>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>li.active>a:focus {
	color: #3c763d;
	background-color: #fff;
	border-color: #d6e9c6;
	border-bottom-color: transparent;
}

.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu {
	background-color: #dff0d8;
	border-color: #d6e9c6;
}

.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu>li>a {
	color: #3c763d;
}

.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu>li>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu>li>a:focus
	{
	background-color: #d6e9c6;
}

.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu>.active>a,
	.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu>.active>a:hover,
	.with-nav-tabs.panel-success .nav-tabs>li.dropdown .dropdown-menu>.active>a:focus
	{
	color: #fff;
	background-color: #3c763d;
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
							$(".lazy").fn.lazyload();
							$(".lazy").lazyload();
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
												alert('selectListNum : '
														+ selectListNum
														+ ' currentCategory : '
														+ currentCategory);
												category(currentCategory);
											});
						});

		var searchKeyword;
		var currentCategory;
		var currentPageNum;
		var selectListNum;

		function fncGetList(currentPage) {
			alert("currentPage : " + currentPage);
			document.getElementById("currentPage").value = currentPage;
			currentPageNum = currentPage;
			category(currentCategory);

		}

		window.category = function(category) {

			alert("categogy : " + category);

			currentPageNum = document.getElementById("currentPage").value;

			if (typeof category === 'undefined') {
				currentCategory = document.getElementById("currentCategory").value;
				alert("currentCategory2 : " + currentCategory);
			} else {

				if (category != 'inquiry') {
					if (category != 'newest') {
						currentCategory = category.id;
						alert("currentCategory1 : " + currentCategory);
					}
				} else {
					currentCategory = category;
					alert("currentCategory3 : " + currentCategory);
				}
			}
			document.getElementById("currentCategory").value = currentCategory;

			var searchKeyword = document.getElementById("searchKeyword").value;

			if (typeof selectListNum === 'undefined') {
				selectListNum = 10;
			}

			if (typeof currentPageNum === 'undefined') {
				var params = 'searchCategory=' + currentCategory + '&pageSize='
						+ selectListNum;
			} else {
				var params = 'searchCategory=' + currentCategory + '&pageSize='
						+ selectListNum + '&currentPage=' + currentPageNum;
			}

			alert(params);
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
														+ i + ");'>" + i
														+ "</a>");
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

									var selector = $("#"
											+ result.search.searchCategory);
									selector.empty();
									alert(result.search.searchCategory);
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
									$(".lazy").fn.lazyload();
									$(".lazy").lazyload();
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
	<input type="hidden" id="path"
		value="${pageContext.servletContext.contextPath }">
	<div class="containerTap">
		<div class="panel with-nav-tabs panel-success">
			<div class="panel-heading">
				<ul class="nav nav-tabs">
					<li
						<c:if test="${ search.searchCategory.trim() eq 'inquiry' }">class="active"</c:if>><a
						title="inquiry" href="#inquiry" onclick="category(inquiry)"data-toggle="tab">조회순</a></li>
					<li
						<c:if test="${ search.searchCategory.trim() eq 'newest' }">class="active"</c:if>><a
						title="newest" href="#recommend"onclick="category(newest)" data-toggle="tab"
						class="category">최신순</a></li>
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
</BODY>
</HTML>