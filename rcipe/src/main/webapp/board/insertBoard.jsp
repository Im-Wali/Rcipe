<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<HEAD>
<title>Recipe</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="//cdn.ckeditor.com/4.4.7/standard/ckeditor.js"></script>
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
</style>
<script type="text/javascript">
	function selectCategory(value, value2) {
		document.getElementById("select_category").innerHTML = value;
		document.getElementById("boardCategory").value = value2;
	};
	$('document').ready(function() {
		$('#boardSubmit').click(function(event) {
			if ($('#boardTitle').val() == '') {
				alert("제목을 입력하세요");
				event.preventDefault();
				$('#boardTitle').focus();
			} else if ($('#boardCategory').val() == '') {
				alert("카테고리를 선택해주세요.");
				event.preventDefault();
				$('#boardCategory').focus();
			} else if (editor.getData() == '') {
				alert("내용을 입력하세요")
				event.preventDefault();
				editor.focus();
			}
			checkUnload = false;
		});
		var checkUnload = true;
		$(window).on("beforeunload", function() {
			if (checkUnload) {return "페이지를 벗어나면 작성된 내용은 삭제됩니다.";
			}
		});
		$(window).unload(function() {
			if (checkUnload) {
				$.post("../file/deleteBoarFile", function(data) {
					alert("AAA");
				});
			}
		});
	})
</script>
</script>
</HEAD>
<body>
	<jsp:include page="/main/menuBar.jsp"></jsp:include>
	<div class="row" style="margin-top: 4%; text-align: left;">
		<div class="col-md-2 "></div>
		<div class="col-md-8 ">
			<form action="${pageContext.servletContext.contextPath }/app/board/insertBoard" method="POST">
				<div class="form-login " style="margin-bottom: 2%;">
					<h3 align="center" style="margin-bottm: 1%;">게시판글 등록</h3>
					<div style="margin-top: 1%">
						<label for="title"
							style="color: red; font-size: x-large; margin: 1%">*제목</label><input
							type="text" class="form-control" id="boardTitle"
							name="boardTitle" placeholder="제목을 입력하세요">
						<!-- Single button -->
						<div align="right" style="margin-top: 1%">
							<span><button type="button" class="btn btn-warning">
									<span id="select_category">카테고리</span>
								</button></span>
						</div>
						<div align="right">
							<div style="margin-top: 1%;" align="left">
								<label style="color: red; font-size: x-large;">*게시판글
									내용입력</label>
							</div>
							<div class="btn-group" style="margin-top: -7%;" align="right">
								<input type="hidden" id="boardCategory" name="boardCategory"
									value="">
								<!-- <button type="button" class="btn btn-warning dropdown-toggle "
									data-toggle="dropdown">
									<span id="select_category">카테고리</span> <span class="caret">
									</span>
								</button> -->
								<!-- 								<ul class="dropdown-menu" role="menu"> -->
								<span><a id="search_contents_"
									onclick="javascript:selectCategory('레시피','1')"> <!-- <img src="../img/category/recipe.png" class="img-circle" role="button"
                                    style="width: 50px; height: 50px; margin-top: 1%"
                                    aria-haspopup="true" aria-expanded="false" id=""> -->
										<button type="button" class="btn btn-info">
											<span>레시피</span>
										</button>
								</a></span> <span><a id=""
									onclick="javascript:selectCategory('추천맛집','2')"> <!-- <img src="../img/category/recommend.jpg" class="img-circle" role="button"
                                    style="width: 50px; height: 50px; margin-top: 1%"
                                    aria-haspopup="true" aria-expanded="false" id=""> -->
										<button type="button" class="btn btn-info">
											<span>추천맛집</span>
										</button>
								</a></span> <span><a id="search_contents_nickname"
									onclick="javascript:selectCategory('고민상담','3')"> <!-- <img src="../img/category/help.png" class="img-circle" role="button"
                                    style="width: 50px; height: 50px; margin-top: 1%"
                                    aria-haspopup="true" aria-expanded="false" id=""_> -->
										<button type="button" class="btn btn-info">
											<span>고민상담</span>
										</button>
								</a></span> <span><a id="search_contents_nickname"
									onclick="javascript:selectCategory('기타','4')"> <!-- <img src="../img/category/etc.png" class="img-circle" role="button"
                                    style="width: 50px; height: 50px; margin-top: 1%"
                                    aria-haspopup="true" aria-expanded="false" id=""> -->
										<button type="button" class="btn btn-info">
											<span>기타</span>
										</button>
								</a></span>
								<!-- 								</ul> -->
							</div>
							<div align="right" style="margin-top: -1%">
								<span><label style="color: red;">*카테고리를 선택하세요.</label></span>
							</div>
						</div>
						<div>
							<textarea name="boardContent" id="editor1" class="ckeditor"> </textarea>
						</div>
						<div align="right" style="margin-top: 1%">
							<span><button type="submit" class="btn btn-info"
									id="boardSubmit">등록</button></span> <span><button type="reset"
									class="btn btn-info">취소</button></span>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-2 "></div>
	</div>
	<script>
		CKEDITOR.replace('editor1', {
			'filebrowserUploadUrl' : '../file/uploadBoard',
			enterMode : '2',
			shiftEnterMode : '3',
			width : '100%',
			height : 500,
			toolbar : [
					[ 'Source', '-', 'Save', 'NewPage', 'Preview', '-',
							'Templates' ],
					[ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord',
							'-', 'Print', 'SpellChecker', 'Scayt' ],
					[ 'Undo', 'Redo', '-', 'Find', 'Replace', '-', 'SelectAll',
							'RemoveFormat' ],
					[ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea',
							'Select', 'Button', 'ImageButton', 'HiddenField' ],
					[ 'Bold', 'Italic', 'Underline', 'Strike', '-',
							'Subscript', 'Superscript' ],
					[ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent',
							'Blockquote' ],
					[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight',
							'JustifyBlock' ],
					[ 'Link', 'Unlink', 'Anchor' ],
					[ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley',
							'SpecialChar', 'PageBreak' ],
					[ 'Styles', 'Format', 'Font', 'FontSize' ],
					[ 'TextColor', 'BGColor' ], ]
		});
		var editor;
		CKEDITOR
				.on(
						'instanceReady',
						function(ev) {
							editor = ev.editor;
							document.getElementById('readOnlyOn').style.display = '';
							editor
									.on(
											'readOnly',
											function() {
												document
														.getElementById('readOnlyOn').style.display = this.readOnly ? 'none'
														: '';
												document
														.getElementById('readOnlyOff').style.display = this.readOnly ? ''
														: 'none';
											});
						});
	</script>
</body>
</HEAD>