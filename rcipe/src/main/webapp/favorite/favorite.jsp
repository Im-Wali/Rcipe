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
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

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
	<input type="hidden" id="nickname" value="${user.nickname}">
	<%-- <input type="hidden" id="starAvg" value="${favorite.starAvg}" /> --%>
	<div><jsp:include page="../main/menuBar.jsp"></jsp:include></div>

	<form name="detailForm"
		action="${pageContext.servletContext.contextPath }/app/favorite/getfavoriteList"
		method="get">
		<input type="hidden" id="currentPage" name="currentPage" value="" />
		<div class="container">
			<div align="center" style="margin-top: 2%; margin-bottom: 4%">
				<h1>즐겨찾기목록</h1>
			</div>
			<div class="form-login " style="margin-bottom: 2%;">
				<div class="row">
					<!--            추가 시작-->
					<div id="favoriteList">
						<c:set var="i" value="0" />
						<%--                    <c:set var="item" value="${favorite.favorList }" /> --%>
						<c:forEach var="favorite" items="${ list }">
							<c:set var="i" value="${i+1 }" />
							<div id="favorite${i}">
								<div class="col-md-6">
									<div class="well well-sm">
										<div class="row">
											<div class="col-xs-3 col-md-3 text-center">
												<a
													href="../../app/recipe/viewRecipe?recipeNo=${favorite.recipeNo}"><img
													src=" ../../images/${ favorite.recipe.titleImage }" alt="bootsnipp"
													style="width: 114px; height: 114px; position: absolute;"
													class="img-rounded img-responsive" /></a>
											</div>

											<div class="col-xs-9 col-md-9 section-box">
												<div id="favoriteBody${i}" style="width:100%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap; font-family:'맑은고딕';">
													<a
														href="../../app/recipe/viewRecipe?recipeNo=${favorite.recipeNo}"
														style="color: black"><h2>${ favorite.favorTitle }</h2></a>
												</div>
												<div align="left">${ favorite.recipe.recipeContents }</div>
												<div align="right">
													<button type="button"
														class="btn btn-warning removeFavorite"
														title="${favorite.recipeNo}">즐겨찾기 삭제</button>
													<button type="button"
														class="btn btn-warning modifyFavorite" data-toggle="modal"
														data-target="#modifyFavorite" data-backdrop="false"
														data-dismiss="modal"
														title="${favorite.recipeNo},${ favorite.favorTitle }">수정</button>
												</div>
												<hr />
												<div class="row rating-desc">
													<div class="col-md-12">
														<div id="fixedStar" data-rating='${favorite.starAvg }'
															style="color: orange; margin-right: 9px; size: 2em">
															<c:forEach begin="1" end="${favorite.starAvg }">
																<i class='fa fa-star' style='margin-right: -8px;'></i>
															</c:forEach>
															<c:forEach begin="${favorite.starAvg }" end="4">
																<i class='fa fa-star-o' style='margin-right: -8px'></i>
															</c:forEach>
														</div>
														<span id="count-existing">현재 별점:${favorite.starCnt !="" ? favorite.starAvg : 0  }점</span>
														<span class="separator">|</span> <span
															class="glyphicon glyphicon-comment"></span>(${ favorite.cmtCnt }
														Comments)
													</div>
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
		</div>
	</form>
	<div id="pagingfooter" class="pagingfooter" style="margin-left: 47%;">
		<jsp:include page="/commons/navigationPage.jsp" />
	</div>
	<input type="hidden" id="projectPath"
		value="${pageContext.servletContext.contextPath }">

	<div class="modal fade" id="modifyFavorite" tabindex="-1" role="dialog"
		aria-labelledby="modifyFavoriteAdd" aria-hidden="true">
		<form action="updateFavorite" method="POST" id="modifyFavorite">
			<div class="modal-dialog" style="border-color: white"">
				<div class="modal-content" style="border-color: white"">
					<div class="modal-header" style="border-color: white"border-color:black">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">즐겨찾기 수정</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="control-label" style="margin-bottom: 10px;">제목</label>
							<input type="hidden" name="recipeNo" id="modifyRecipeNo" value="">
							<input type="text" class="form-control" id="modifyFavorTitle"
								maxlength="12" name="favorTitle" value="">
							<div class="modal-footer">
								<button class="btn btn-primary" id="" type="submit">수정</button>
								<!--          <input type="image" src="login.gif" alt="로그인" /> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script>
		function fncGetList(currentPage) {
			document.getElementById("currentPage").value = currentPage;
			document.detailForm.submit();
		}
		$(document)
				.ready(
						function() {

							$(document.body)
									.on(
											'click',
											'.removeFavorite',
											function(event) {
												event.preventDefault();
												var f = confirm('해당 즐겨찾기를 삭제하시겠습니까');
												if (f) {
													$
															.ajax(
																	"../favorite/deleteFavorite",
																	{
																		method : 'POST',
																		dataType : 'json',
																		data : 'recipeNo='
																				+ this.title
																				+ '&nickname='
																				+ $(
																						'#nickname')
																						.val(),
																		success : function(
																				result) {
																			alert("해당 즐겨찾기를 삭제했습니다.");
																			var list = result.list;
																			alert("result.totalCount : "
																					+ result.totalCount);
																			listFavorite(
																					'#favoriteList',
																					list);
																		}
																	});
												}

												function listFavorite(id, list) {
													var str = "";
													var projectPath = $(
															"#projectPath")
															.val();
													for ( var i in list) {
														str += "<div id ='favorite"+i+"'>"
																+ "<div class='col-md-6'>"
																+ "<div class='well well-sm'>"
																+ "<div class='row'>"
																+ "<div class='col-xs-3 col-md-3 text-center'>"
																+ "<a href='"
																+ projectPath
																+ "/app/recipe/viewRecipe?recipeNo="
																+ list[i].recipeNo
																+ "'>"
																+ "<img src='../../images/"+list[i].recipe.titleImage +"' alt='bootsnipp' style='width: 114px; height: 114px; position: absolute;'"
                                          +" class='img-rounded img-responsive' /></a></div>"
																+ "<div class='col-xs-9 col-md-9 section-box'>"
																+ "<a href='"
																+ projectPath
																+ "/app/recipe/viewRecipe?recipeNo="
																+ list[i].recipeNo
																+ "' style='color: black'>"
																+ "<h2 style=''>"
																+ list[i].favorTitle
																+ "</h2></a>"
																+ "<div align='left'>"
																+ list[i].recipe.recipeContents
																+ "</div>"
																+ "<div align='right'><button type='button' class='btn btn-warning removeFavorite' title='"+list[i].recipeNo+"'>즐겨찾기 삭제</button>"
																+ " <button type='button' class='btn btn-warning modifyFavorite' data-toggle='modal' data-target='#modifyFavorite'"
                                            + " data-backdrop='false' data-dismiss='modal' title='"+list[i].recipeNo+","+list[i].favorTitle+"'>수정</button></div>"
																+ "<hr /><div class='row rating-desc'>"
																+ "<div class='col-md-12'>"
																+ "<div id='fixedStar' data-rating='"+list[i].starAvg+"'"
                                                                        +" style='color: orange; margin-right: 9px; size: 2em'>"
														if (list[i].starAvg != null) {
															for (var j = 1; j <= list[i].starAvg; j++) {
																str += " <i class='fa fa-star' style='margin-right: -8px;'></i>"
															}
															for (var j = list[i].starAvg; j <= 4; j++) {
																str += " <i class='fa fa-star-o' style='margin-right: -8px'></i>"
															}
														}
														if (list[i].starAvg == null) {
															for (var k = 1; k <= 5; k++) {
																str += " <i class='fa fa-star-o' style='margin-right: -8px'></i>"
															}
														}
														str += "</div><span id='count-existing'>현재 별점:"
																+ (list[i].starCnt != null ? list[i].starAvg
																		: 0)
																+ "점</span>"
																+ "<span class='separator'>|</span> <span class='glyphicon glyphicon-comment'></span>("
																+ list[i].cmtCnt
																+ "Comments)"
																+ "</div></div></div></div></div></div>"
																+ "</div>";
													}
													$(id).html(str);
												}
												;

											});

							$(document.body)
									.on(
											'click',
											'.modifyFavorite',
											function(event) {
												event.preventDefault();
												var recipeNo = this.title
														.split(",")[0];
												var favorTitle = this.title
														.split(",")[1];
												$("#modifyFavorTitle").val(
														favorTitle);
												$("#modifyRecipeNo").val(
														recipeNo);

											});

							$(document.body)
									.on(
											'submit',
											'#modifyFavorite',
											function(event) {
												if ($("#modifyFavorTitle")
														.val() == "") {
													alert("제목을 적어주세요");
													event.preventDefault();
													return;
												}
											});
						})
	</script>
</body>
</html>

