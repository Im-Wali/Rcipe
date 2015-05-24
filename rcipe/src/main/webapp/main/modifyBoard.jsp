<%@page import="java.util.Date"%>
<%@page import="com.rcipe.service.domain.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<HEAD>
<%-- <%
	Board board = new Board(
			10021,
			"user01",
			"test1",
			"아아아아아아아아아아아아엥에에에엥<br />"
					+ "ㅇ엥엥에에에에엥엉어어어어어어어어<br />"
					+ "어어어어어어엉엉어엉ㅇㅇ엉어엉엉어엉엉어어엉어어엉ㄻㄴㅇㄻㄴㅇ러<br />"
					+ "<br />"
					+ "ㅁㄴㅇ러<br />"
					+ "ㅁㄴㅇㄻ넝ㄻㄴㅇ<img alt='' src=' http://192.168.200.159:8080/rcipe/images/user01/1432272482129/1432272482169.JPG' style='height:194px; width:309px' /><br />"
					+ "어<br />" + "어<br />" + "어<br />" + "어<br />"
					+ "어<br />" + "에", 1, new Date(2015, 03, 29), 30,
			"", null);
%> --%>
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
		$(window).load(function(){
			var n =${board.boardCategory};
			var str;
			if (n == 1) {
				str = "레시피";
			} else if (n == 2) {
				str = "추천맛집";
			} else if (n == 3) {
				str = "고민상담";
			} else {
				str = "기타";
			}
			$('#select_category').html(str);
			$('#boardCategory').val(n);
		});
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
		});
	})
</script>
</HEAD>
<body>
	<jsp:include page="../main/menuBar.jsp"></jsp:include>
	<div class="row" style="margin-top: 4%; text-align: left;">
		<div class="col-md-2 "></div>
		<div class="col-md-8 ">
			<form action="modifyBoard" method="POST">
				<div align="right">
					<label style="font-size:1.2em;margin-right:1%;">등록된 날짜:<%-- <%=board.getBoardDate().getYear()%>/
					<%=board.getBoardDate().getMonth()%>/
					<%=board.getBoardDate().getDate()%>/
					<%=board.getBoardDate().getHours()%>:
					<%=board.getBoardDate().getMinutes()%>:
					<%=board.getBoardDate().getSeconds()%> --%>${board.boardDate }</label>
				</div>
				<input type="hidden" name="boardNo" id="boardNo" value="${ board.boardNo}">
				<div class="form-login " style="margin-bottom: 2%;">
					<h3 align="center" style="margin-bottm: 1%;">게시판글 수정</h3>
					<div style="margin-top: 1%">
						<label for="title"
							style="color: red; font-size: x-large; margin: 1%">*제목</label><input
							type="text" class="form-control" id="boardTitle"
							name="boardTitle" placeholder="제목을 입려하세요"
							value="${board.boardTitle}">
						<!-- Single button -->
						<div align="right">
							<div style="margin-top: 1%;" align="left">
								<label style="color: red; font-size: x-large;">*게시판글
									내용입력</label>
							</div>
							<div class="btn-group" style="margin-top: -7%;">
								<input type="hidden" id="boardCategory" name="boardCategory"
									value="">
								<button type="button" class="btn btn-warning dropdown-toggle "
									data-toggle="dropdown">
									<span id="select_category">카테고리</span> <span class="caret">
									</span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a onclick="javascript:selectCategory('레시피','1')">레시피</a></li>
									<li><a onclick="javascript:selectCategory('추천맛집','2')">추천맛집</a></li>
									<li><a id="search_contents_nickname"
										onclick="javascript:selectCategory('고민상담','3')">고민상담</a></li>
									<li><a id="search_contents_nickname"
										onclick="javascript:selectCategory('기타','4')">기타</a></li>
								</ul>
							</div>
						</div>
						<div>
							<textarea name="boardContent" id="editor1" class="ckeditor"> ${board.boardContent}</textarea>
						</div>
						<div align="right" style="margin-top: 1%">
							<span><button type="submit" class="btn btn-warning"
									id="boardSubmit">등록</button></span> <span><button type="reset"
									class="btn btn-warning">취소</button></span>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-2 "></div>
	</div>
	<script>
		CKEDITOR.replace('editor1', {
			'filebrowserUploadUrl' : '../app/file/uploadBoard',
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