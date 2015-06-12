<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/bootstrap-filestyle.js"></script>

<style type="text/css">
body {
	background-color: #fff;
	-webkit-font-smoothing: antialiased;
	font: normal 14px Roboto, arial, sans-serif;
}

.container {
	padding: 25px;
	position: fixed;
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
<script type="text/javascript">
	$("document")
			.ready(
					function() {
						var detailCount = $("#detailCount").val();
						var detailNumber =$("#detailNumber").val();
						var checkUnload = true;

						//처음 두개의 img태그에 event등록
						var dropzone1 = document.getElementById('titleImage');
						setDnDhandler(dropzone1);
						var dropzone2 = document.getElementById('detailImage1');
						setDnDhandler(dropzone2);

						$(window).on("beforeunload", function() {
							if (checkUnload) {
								return "페이지를 벗어나면 작성된 내용은 삭제됩니다.";
							}
						});
						$(window).unload(
								function() {
									if (checkUnload) {
										$.post("../file/deleteRecipeFile",
												function(data) {
													alert(data);
												});
									}
								});

						$(document.body)
								.on(
										'click',
										'.addDetail',
										function(event) {
											detailNumber++;
											detailCount++;
											$("#detailCount").val(detailCount);
											$("#detailNumber")
													.val(detailNumber);
											alert("detailNumber="
													+ detailNumber);
											alert("detailCount=" + detailCount);
											$("#detailLastDiv")
													.before(
															"<div class='form-login ' style='margin-bottom: 2%;' id='detail"
																	+ detailNumber
																	+ "'>"
																	+ "<button type='button' class='close recipeClose' data-dismiss='modal'"
																	+ "value='detail"+detailNumber+"' aria-label='Close'>"
																	+ "<span>&times;</span>"
																	+ "</button>"
																	+ "<h3 align='center' style='margin-bottm: 1%'>상세 레시피 작성</h3>"
																	+ "<div style='margin-top: 1%'>"
																	+ "<div class='media'>"
																	+ "<div class='media-left'>"
																	+ "<input type='hidden' id='imagedetailImage"+detailNumber+"' name='detailImage"+detailNumber+"' value=''>"
																	+ "<img"
							+" class='media-object img-rounded fileUpload'"
							+"src='../img/images3.jpg'  id='detailImage"+detailNumber+"' >"
																	+ "</div>"
																	+ "<div style='color: red; margin-right: 1%; margin-top: 1%'>*등록할"
																	+ "사진을 위의 공간에 드래그 하세요</div>"
																	+ "<div style='margin-top: 1%'>"
																	+ "<input type='file' class='filestyle recipeButtonUpload'"
							+"data-buttonName='btn-warning' data-input='false'  id='recipeButtobUpload"+detailNumber+"'"
							+"data-buttonText='사진 등록' alt='detailImage"+detailNumber+"'>"
																	+ "</div>"
																	+ "<div style='margin: 1%'>"
																	+ "<label style='font-size: x-large; margin: 1%'>사진에 대한 설명</label>"
																	+ "</div>"
																	+ "<div>"
																	+ "<textarea class='form-control' rows='5'"
							+"placeholder='사진에 대한 설명을 적어주세요' name='detailContents"+detailNumber+"' ></textarea>"
																	+ "</div>"
																	+ "</div>"
																	+ "</div>"
																	+ "	</div>");

											$(":file").filestyle();
											$(":file")
													.filestyle('input', false);
											$(":file").filestyle('icon', false);
											$(":file").filestyle('buttonText',
													'사진 등록');
											$(":file").filestyle('buttonName',
													'btn-warning');
											/* 	$(":file").addClass('filestyle');  */
											//event등록
											setDnDhandler(document
													.getElementById('detailImage'
															+ detailNumber));
										});
						$(document.body).on('click', '.recipeClose',
								function(event) {
									//해당 상세레시피의 사진을 지운다.
									//removePicture(this.val());
									if (detailCount == 1) {
										alert("하나이상의 상세레시피를 작성해야합니다.")
										return;
									}
									var str=$(this).val()
									if ($("#imagedetailImage" +str.substring(str.length-1)).val()!="") {
										deletePicture($("#imagedetailImage" +str.substring(str.length-1)).val());
									}
									$("#" + $(this).val()).remove();
									detailCount--;
									$("#detailCount").val(detailCount);
								});

						function fileHandler(str) {
							str = str.replace(/\+/g, " ");
							var str2 = str.split("massage")[1].substring("1")
									.split(",")[0];
							alert(str2);
							var str3 = str.split("changeImg")[1].substring("1")
									.split(",")[0];
							$("#" + fileUploadId).attr("src",
									"../../images/" + str3);
							var t = $("#image" + fileUploadId).val();
							if (t.length > 1) {
								//해당 "recipe"+id 의 아이디로 hidden태그가 있다면 거기에 있는 파일 삭제 ajax를 사용한다.
								deletePicture(t);

							}
							$("#image" + fileUploadId).val(str3);
						}
						;
						function deletePicture(t) {
							$.ajax("../file/deletePicture", {
								method : 'POST',
								data : 'path=' + t,
								success : function(result) {
								}
							});
						}
						;

						//해당 업로드 되는 곳의 id를 저장해서 나중에 image를 바뀌준다.
						var fileUploadId = "";
						$(document.body).on('mouseenter', '.fileUpload',
								function(event) {
									var id = $(this).attr("id");
									fileUploadId = id;
								});
						$(document.body).on('click', '.recipeButtonUpload',
								function(event) {
									var id = $(this).attr("alt");
									fileUploadId = id;
								});
						function setDnDhandler(obj) {
							obj.addEventListener("dragover", function(event) {
								event.preventDefault();
							}, true);
							obj
									.addEventListener(
											"drop",
											function(event) {
												event.preventDefault();
												var allTheFiles = event.dataTransfer.files;
												// 여러개 의 파일을 업로드할 경우를 대비하여 이런
												// 방법을사용했다.
												if (allTheFiles.length === 1) {
													for (var i = 0; i < allTheFiles.length; i++) {
														var element = document
																.createElement('div');
														element.id = 'f' + i;
														document.body
																.appendChild(element);
														sendFile(
																allTheFiles[i],
																element.id);
													}
												} else {
													alert("하나만 업로드 가능합니다.");
												}
											}, true);
						}
						function sendFile(file, fileId) {
							var xhr = new XMLHttpRequest();
							xhr.onreadystatechange = function() {
								if (xhr.readyState == 4 && xhr.status == 200) {
									// 정확히 수행되면 alert창 띄움
									var str = decodeURIComponent(xhr.responseText);
									fileHandler(str);
								}
							};
							// var p=$('#pictureLcation').val();
							// xhr.open("POST","../app/"+p);
							xhr.open("POST", "../file/recipePictureUpload");
							var fd = new FormData();
							fd.append("file", file);
							xhr.send(fd);
						}
						;
						$(":file").filestyle('icon', false);
						//불리언 변수 함부로 ajxa가 실행하는것을 막는 변수
						//$(":file").filestyle('clear');이부분을 실행시에 또호출되기때문에
						var isFile = false;
						//프로필 수정 버튼에서 파일을 선택하면 실행한다. 파일을 업로드하는 AJAX

						$(document.body)
								.on(
										'change',
										'.recipeButtonUpload',
										function() {
											if (isFile) {
												return;
											}
											isFile = true;
											var id = $(this).attr("id");
											var formData = new FormData();
											$.each($('#' + id)[0].files,
													function(i, file) {
														formData.append('file',
																file);
													});
											$
													.ajax({
														url : '../file/recipePictureUpload',
														data : formData,
														processData : false,
														contentType : false,
														type : 'POST',
														success : function(data) {
															var str = decodeURIComponent(data);
															fileHandler(str);
															$(":file")
																	.filestyle(
																			'clear');
															isFile = false;
														},
														error : function(data) {
															alert("파일업로드에 실패했습니다.")
														}
													});
										});
						$("#ingredients").focus(function() {
							$("#ingredientOpen").click();
						});
						$("#recipeSubmit").click(function(event){
							var title=$("#recipeTitle").val();
							var mainImage=$("#imagetitleImage").val();
							var ingredient=$("#ingredients").val();
							var recipeContents=$("#recipeContents").val();
							var tip=$("#tip").val();
							if(title==""){
								alert("제목을 적어주세요!!!");
								event.preventDefault();
								return;
							}else if(mainImage==""){
								alert("메인 이미지를 업로드해주세요");
								event.preventDefault();
								return;
							}else if(ingredient==""){
								alert("음식재료를 입력해주세요");
								event.preventDefault();
								return;
							}else if(recipeContents==""){
								alert("간단한 설몀을 입력해주세요");
								event.preventDefault();
								return;
							}else if(tip==""){
								alert("TIP을 입력해주세요");
								event.preventDefault();
								return;
							}else{
								for(var i=1;i<=detailNumber;i++){
									var image=$("#imagedetailImage"+i).val();
									if(image==""){
										alert("상세 레시피의 사진을 등록해야합니다.");
										event.preventDefault();
										return;
									}
								}
							}
							checkUnload=false;
						});
					});
</script>
</HEAD>

<BODY>
	<div><jsp:include page="../main/menuBar.jsp"></jsp:include></div>
	<div><jsp:include page="ingredient.jsp"></jsp:include></div>
	<div class="row" style="margin-top: 4%; text-align: left;">
		<div class="col-md-2 "></div>
		<div class="col-md-8 ">
			<form role="form" action="${pageContext.servletContext.contextPath }/app/recipe/insertRecipe" method="post">
				<input type="hidden" id="detailCount" name="detailCount" value="1">
				<input type="hidden" id="detailNumber" name="detailNumber" value="1">
				<input type="hidden" id="ingredientIds"name="ingredientIds" value="">
				<div align="right">
					<span style="color: red; margin-right: 1%">*추가적인 사진과 정보를
						입력하세요!</span> <input type="button" class="btn   btn-lg addDetail"
						value="추가 사진 등록" style="margin-right: 1%; margin-bottom: 1%"
						> <input type="submit" id="recipeSubmit"
						class="btn  btn-lg" value="레시피 등록"
						style="margin-right: 1%; margin-bottom: 1%;">
				</div>
				<div class="form-login " style="margin-bottom: 2%;">
					<h3 align="center" style="margin-bottm: 1%">레시피 등록</h3>
					<div style="margin-top: 1%">
						<label for="title"
							style="color: red; font-size: x-large; margin: 1%">*제목</label><input
							type="text" class="form-control" id="recipeTitle"
							name="recipeTitle" placeholder="제목을 입려하세요">
					</div>
					<div style="margin-top: 1%">
						<label for="mainImage"
							style="color: red; font-size: x-large; margin: 1%">*메인 사진</label><br />
						<div class="media">
							<input type="hidden" id="imagetitleImage" name="titleImage"
								value="">
							<div class="media-left">
								<img class="media-object img-rounded fileUpload"
									src="${pageContext.servletContext.contextPath}/img/images3.jpg" alt="..." id="titleImage">
							</div>
							<div style="color: red; margin-right: 1%; margin-top: 1%">*등록할
								사진을 위의 공간에 드래그 하세요</div>
							<div style="margin-top: 1%">
								<input type="file" class="filestyle recipeButtonUpload"
									data-buttonName="btn-warning" data-input="false"
									data-buttonText="메인 사진 등록" alt="titleImage">
							</div>
							<div style="margin: 1%">
								<label style="color: red; font-size: x-large;">*재료 입력(검색하여 추가해주세요)</label> 예)
								당근(1개),시금치(100g),빵(조금) <a href="#" class="btn btn-warning"
									data-toggle="modal" data-target="#ingredient"
									data-whatever="ingredient" data-backdrop="false"
									id="ingredientOpen">재료검색</a>
							</div>
							<div>
								<textarea class="form-control" readonly="readonly" rows="3" style="background-color:white"
									placeholder="재료를 입력하세요" id="ingredients" name="ingredients"></textarea>
							</div>
							<div style="margin: 1%">
								<label style="color: red; font-size: x-large;">*간단한 설명</label>
							</div>
							<div>
								<textarea class="form-control" rows="10"
									placeholder="간단한 설명을 적어주세요" name="recipeContents"></textarea>
							</div>
							<div style="margin: 1%">
								<label style="color: red; font-size: x-large;">*Tip</label>
							</div>
							<div>
								<textarea class="form-control" rows="3" placeholder="Tip을 적어주세요" id="tip"
									name="tip"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="form-login " style="margin-bottom: 2%;" id="detail1">
					<!-- 여기서 CLOSE버튼을 누루면 해당 설명 from 사라짐 -->
					<button type="button" class="close recipeClose"
						data-dismiss="modal" aria-label="Close" value="detail1">
						<span>&times;</span>
					</button>
					<h3 align="center" style="margin-bottm: 1%">상세 레시피 작성</h3>
					<div style="margin-top: 1%">
						<div class="media">
							<div class="media-left">
								<input type="hidden" id="imagedetailImage1" name="detailImage1"
									value=""> <img
									class="media-object img-rounded fileUpload"
									src="${pageContext.servletContext.contextPath}/img/images3.jpg" alt="..." id="detailImage1">
							</div>
							<div style="color: red; margin-right: 1%; margin-top: 1%">*등록할
								사진을 위의 공간에 드래그 하세요</div>
							<div style="margin-top: 1%">
								<input type="file" class="filestyle recipeButtonUpload"
									data-buttonName="btn-warning" data-input="false"
									data-buttonText="사진 등록" alt="detailImage1">
							</div>
							<div style="margin: 1%">
								<label style="font-size: x-large; margin: 1%">사진에 대한 설명</label>
							</div>
							<div>
								<textarea class="form-control" rows="5"
									placeholder="사진에 대한 설명을 적어주세요" name="detailContents1"></textarea>
							</div>
						</div>
					</div>
				</div>
				<!-- 해당 태그.before에 상세레시피 차레대로 나옴 -->
				<div id="detailLastDiv"></div>
				<div class="form-login " style="margin-bottom: 2%;" align="center">
					<div>
					<input type="button" class="btn   btn-lg addDetail" 
						value="추가 사진 등록" style="margin-right: 1%; margin-bottom: 1%;width: 100%;height:100%;background-color:#707070;color:white"
						>
					</div>
					<div>
						<span style="color: red; margin-right: 1%">*추가적인 사진과 정보를
							입력하세요!</span>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</BODY>
</HTML>