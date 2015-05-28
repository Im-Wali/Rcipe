<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var isUpdate = true;
						var isReplyUpdate = true;
						var isReplyList = true;
						var replyListId = '';
						$(document.body)
								.on(
										'click',
										'.replyList',
										function(event) {
											event.preventDefault();
											if (!isReplyList) {
												$("#" + replyListId).html('');
											}
											isReplyList = false;
											var commentRe = this.title
													.split(",")[0];
											var replyCnt = this.title
													.split(",")[1];
											var replyListId1 = this.title
													.split(",")[2];
											replyListId = replyListId1;
											var s = "<div class='row'>"
													+ "<div class='col-md-1' align='center'>"
													+ " <span class='glyphicon glyphicon-arrow-right'"
													+ " style='margin-top: 2%; font-size: 1.5em; margin-left: 2%'></span></div>"
													+ " <div class='col-md-1'>"
													+ " <img alt='' class='img-circle' src='../../images/"
													+ $("#userImg").val()
													+ "' width='70px'"
													+ " height='70px' style='margin-top: 1%'></div>"
													+ " <div class='col-md-10'>"
													+ "<textarea class='form-control ' id='replyContent'"
													+ "style='margin-left: 2%; margin-rghit: 2%; width: 98%; height:80px'"
													+ "placeholder='답글을 작성해주세요'></textarea>"
													+ "<div class='form-group' align='right'>"
													+ "<input type='hidden' id='replyCommentReNo' value='"+commentRe+"'>"
													+ "<button type='button' class='btn btn-warning' id='replySubmit' style='margin-top: 1%'"
													+ ">답글작성</button></div></div></div></from><hr />"
													+ "<div id='getReplyList'>";
											$("#" + replyListId1).html(s);
											if (replyCnt != 0) {
												$.ajax("../comment/getReplyList",{
																	method : 'POST',
																	dataType : 'json',
																	data : 'commentReNo='
																			+ commentRe,
																	success : function(
																			result) {
																		var list = result.list;
																		s += (listReply(list) + "</div>");
																		$("#"+ replyListId1).html(s);
																	}
																});
											}
										});
						$(document.body).on(
								'click',
								'#replySubmit',
								function(event) {
									event.preventDefault();
									if ($("#replyContent").val() == '') {
										alert("답글을 작성하세요");
										return;
									}
									var f = confirm('답글을 저장할까요?');
									if (f) {
										$.ajax("../comment/inserReply", {
											method : 'POST',
											dataType : 'json',
											data : 'commentContent='
													+ $('#replyContent').val()
													+ '&'
													+ 'commentReNo='
													+ $('#replyCommentReNo')
															.val(),
											success : function(result) {
												var list = result.list;
												$('#getReplyList').html(
														listReply(list));
												$('#replyContent').val('');
											}
										});
									}
								});
						$(document.body).on(
								'click',
								'.removeReply',
								function(event) {
									event.preventDefault();
									var f = confirm('해당 답글을 삭제하시겠습니까');
									if (f) {
										$.ajax("../comment/deleteReply", {
											method : 'POST',
											dataType : 'json',
											data : 'commentNo=' + this.title
													+ '&commentReNo='
													+ $('#replyCommentReNo').val(),
											success : function(result) {
												alert("해당 답글을 삭제했습니다.");
												var list = result.list;
												$('#getReplyList').html(
														listReply(list));
											}
										});
									}
								});
						$(document.body)
						.on(
								'click',
								'.updateReply',
								function(event) {
									event.preventDefault();
									if (!isUpdate) {
										alert("다른댓글,답글을 수정중입니다.");
										return;
									}
									isUpdate = false;
									var f = confirm('해당 답글을 수정하시겠습니까');
									var s = "";
									var contentId = this.title
											.split(",")[1];
									var contentNo = this.title
											.split(",")[0];
									var commentBody = this.title
											.split(",")[2];
									var content = $("#" + contentId)
											.html();
									if (f) {
										s += "<textarea class='form-control' id='updateReplyContent'"
												+ "name='updateReplyContent'"
												+ "style='margin-left: 2%; margin-rghit: 2%; width: 98%; height: 80px'"
												+ "></textarea>"
												+ "<div class='form-group' align='right'>"
												+ "<button  class='btn btn-warning' id='updateReplySubmit'"
												+ "style='margin-top: 1%;margin-right:1%'>답글수정</button>"
												+ "<button class='btn btn-warning' id='updateReplyReset' style='margin-top:1%;'>취소</button>"
												+ "</div>"
												+ "<input type='hidden' id='updateCommentNo' value='"+contentNo+"'>";
									}
									$("#" + commentBody).html(s);
									document
											.getElementById("updateReplyContent").value = content;
								}); 
						$(document.body)
						.on(
								'click',
								'#updateReplySubmit',
								function(event) {
									isUpdate = true;
									event.preventDefault();
									var s = $('#updateReplyContent')
											.val();
									if (s == '') {
										alert("답글을 작성해주세요");
										return;
									} else {
										alert("답글을 작성했습니다.");
										isUpdate = true;
										$.ajax("../comment/updateReply",
														{
															method : 'POST',
															dataType : 'json',
															data : 'commentContent='
																	+ $('#updateReplyContent').val()
																	+ '&commentNo='+ $('#updateCommentNo').val()
																	+ "&commentReNo="+ $('#replyCommentReNo').val(),
															success : function(
																	result) {
																var list = result.list;
																$("#getReplyList").html(listReply(list));
															}
														});
									}
								});
						$(document.body)
						.on(
								'click',
								'#updateReplyReset',
								function(event) {
									isUpdate = true;
									$.ajax("../comment/getReplyList",{
										method : 'POST',
										dataType : 'json',
										data : 'commentReNo='
												+  $('#replyCommentReNo')
												.val(),
										success : function(
												result) {
											var list = result.list;
											$("#getReplyList").html(listReply(list));
										}
									});
								});
						$(document.body).on(
								'click',
								'.removeComment',
								function(event) {
									event.preventDefault();
									var f = confirm('해당 댓글을 삭제하시겠습니까');
									if (f) {
										$.ajax("../comment/deleteBoardCmt", {
											method : 'POST',
											dataType : 'json',
											data : 'commentNo=' + this.title
													+ '&boardNo='
													+ $('#boardNo').val(),
											success : function(result) {
												alert("해당 댓글을 삭제했습니다.");
												var list = result.list;
												listBoardCmt('#commentList',
														list);
											}
										});
									}
								});
						$(document.body)
						.on(
								'click',
								'#updateReset',
								function(event) {
									isUpdate = true;
									$.ajax("../comment/getBoardCmt", {
										method : 'POST',
										dataType : 'json',
										data : 'contentNo='
												+ $('#contentNo')
														.val(),
										success : function(result) {
											$('#commentContent').val('');
											var list = result.list;
											listBoardCmt('#commentList',
													list);
										}
									});
								});
						$(document.body)
								.on(
										'click',
										'.updateComment',
										function(event) {
											event.preventDefault();
											if (!isUpdate) {
												alert("다른댓글,답글을 수정중입니다.");
												return;
											}
											isUpdate = false;
											var f = confirm('해당 댓글을 수정하시겠습니까');
											var s = "";
											var contentId = this.title
													.split(",")[1];
											var contentNo = this.title
													.split(",")[0];
											var commentBody = this.title
													.split(",")[2];
											var replyCnt = this.title
													.split(",")[3];
											$("#" + replyCnt).html('');
											var content = $("#" + contentId)
													.html();
											if (f) {
												s += "<textarea class='form-control' id='updateCommentContent'"
														+ "name='updateCommentContent'"
														+ "style='margin-left: 2%; margin-rghit: 2%; width: 98%; height: 80px'"
														+ "></textarea>"
														+ "<div class='form-group' align='right'>"
														+ "<button  class='btn btn-warning' id='updateSubmit'"
														+ "style='margin-top: 1%;margin-right:1%'>댓글수정</button>"
														+ "<button class='btn btn-warning' id='updateReset' style='margin-top:1%;'>취소</button>"
														+ "</div>"
														+ "<input type='hidden' id='updateCommentNo' value='"+contentNo+"'>";
											}
											$("#" + commentBody).html(s);
											document
													.getElementById("updateCommentContent").value = content;
										});
						$(document.body)
								.on(
										'click',
										'#updateSubmit',
										function(event) {
											isUpdate = true;
											event.preventDefault();
											var s = $('#updateCommentContent')
													.val();
											if (s == '') {
												alert("댓글을 작성해주세요");
												return;
											} else {
												alert("댓글을 작성했습니다.");
												isUpdate = true;
												$
														.ajax(
																"../comment/updateComment",
																{
																	method : 'POST',
																	dataType : 'json',
																	data : 'commentContent='
																			+ $(
																					'#updateCommentContent')
																					.val()
																			+ '&'
																			+ 'commentNo='
																			+ $(
																					'#updateCommentNo')
																					.val()
																			+ "&contentNo="
																			+ $(
																					'#contentNo')
																					.val(),
																	success : function(
																			result) {
																		var list = result.list;
																		listBoardCmt(
																				'#commentList',
																				list);
																	}
																});
											}

										});
						$('#commentSubmit').click(
								function(event) {
									var s = $('#commentContent').val();
									if (s == '') {
										alert("내용을 입력하세요");
										event.preventDefault();
										return;
									} else {
										alert("댓글을 작성했습니다.");
										$.ajax("../comment/insertBoardCmt", {
											method : 'POST',
											dataType : 'json',
											data : 'commentContent='
													+ $('#commentContent')
															.val() + '&'
													+ 'contentNo='
													+ $('#contentNo').val(),
											success : function(result) {
												$('#commentContent').val('');
												var list = result.list;
												listBoardCmt('#commentList',
														list);
											}
										});
									}
								});
						function listReply(list) {
							var str = "";
							for ( var i in list) {
								str += "<div class='row'>"
										+ "<div class='col-md-1'></div>"
										+ "<div class='col-md-1'>"
										+ "	<div>"
										+ "		<img  class='img-circle' src='../../images/"
										+ list[i].userImg
										+ "' width='70px'"
										+ "height='70px' style='margin-top: 1%'>"
										+ "</div>"
										+ "</div>"
										+ "<div class='col-md-10' id='replyBody"+i+"'>"
										+ "<div>"
										+ "<div class='row'>"
										+ "<div class='col-md-7' align='left'>"
										+ "<div style='margin-left:2%; margin-right: 2%'>"
										+ list[i].nickname
										+ "/"
										+ list[i].commentDate
										+ "</div>"
										+ "</div>"
										if(list[i].nickname ==$('#userNickname').val()){
											str+= "<div class='col-md-5'>"
										+ "<div align='right'>"
										+ "<a style='margin-left: 2%; color: black'class='updateReply'"
										+ "title='"
										+ list[i].commentNo
										+ ",replyContent"
										+ i
										+ ",replyBody"
										+ i
										+ "'>수정</a><a "
										+ "style='margin-left: 2%; color: black' class='removeReply' title='"+list[i].commentNo+"'"
										+ ">삭제</a>"
										+ "</div>"
										+ "</div>";
										}
										str += "</div>"
										+ "</div>"
										+ "<div style='margin-left: 2%; margin-right: 2%; margin-top: 1%' id='replyContent"+i+"'>"
										+ list[i].commentContent
										+ "</div>"
										+ "</div>" + "</div>" + "<hr />";
							}
							return str;
						}
						;
						function listBoardCmt(id, list) {
							var str = "";
							for ( var i in list) {
								str += "<div id='comment"+i+"'><div class='row'>"
										+ "<div class='col-md-1'>"
										+ "<div>"
										+ "<img  class='img-circle' src='../../images/"
										+ list[i].userImg
										+ "' width='70px'"
										+ "height='70px' style='margin-top: 1%''>"
										+ "</div>"
										+ "</div>"
										+ "<div class='col-md-11' id='commentBody"+i+"''>"
										+ "<div>"
										+ "<div class='row'>"
										+ "<div class='col-md-7' align='left'>"
										+ "<div style='margin-left:2%; margin-right: 2%;'>"
										+ list[i].nickname
										+ "/"
										+ list[i].commentDate
										+ "</div>"
										+ "</div>";
										if(list[i].nickname ==$('#userNickname').val()){
										str+= "<div class='col-md-5'>"
										+ "<div align='right'>"
										+ "<a style='margin-left: 2%; color: black'class='updateComment'"
										+ "title='"
										+ list[i].commentNo
										+ ",commentContent"
										+ i
										+ ",commentBody"
										+ i
										+ ",replyCnt"
										+ i
										+ "'>수정</a> <a "
										+ "style='margin-left: 2%; color: black' class='removeComment' title='"
										+ list[i].commentNo
										+ "'>삭제</a>"
										+ "</div>"
										+ "</div>";
										}
										str+= "</div>"
										+ "</div>"
										+ "<div style='margin-left: 2%; margin-right: 2%; margin-top: 1%' id='commentContent"
										+ i
										+ "'>"
										+ list[i].commentContent
										+ "</div>"
										+ "</div>"
										+ "<div align='right' style='margin-right: 2%;'>"
										+ "<a style='color: black'  class='replyList'"
										+"title='"+list[i].commentNo+","+list[i].replyCnt+",comment"+i+"ReplyList'>답글("
										+ list[i].replyCnt
										+ ")개 보기</a>"
										+ "</div>"
										+ "</div>"
										+ "<hr /></div>"
										+ "<div id='comment"+i+"ReplyList'>"
										+ "<div></div>"
										+ "<div id='commen"+i+"Reply0'></div>"
										+ "</div>";
							}
							$(id).html(str);
						}
						;
					});
</script>
<div align="center">
	<h4>댓글</h4>
</div>
<input type="hidden" id="contentNo" value="${board.boardNo}">
<input type="hidden" id="userImg" value="${user.userImage}">
<input type="hidden" id="userNickname" value="${user.nickname}">
<div id="commentContainer">
	<from action="#" method="post">
	<div class="row">
		<div class="col-md-1">
			<img alt="" class="img-circle" src="../../images/${user.userImage}" width="70px"
				height="70px" style="margin-top: 1%">
		</div>
		<div class="col-md-11">
			<!-- <input type="hidden" id="contentNo" value="10089"> -->
			<textarea class="form-control" id="commentContent"
				name="commentContent"
				style="margin-left: 2%; margin-rghit: 2%; width: 98%; height: 80px"
				placeholder="댓글을 작성해주세요"></textarea>

			<div class="form-group" align="right">
				<button type="submit" class="btn btn-warning"
					style="margin-top: 1%;" id="commentSubmit">댓글작성</button>
			</div>
		</div>
	</div>
	</from>
	<hr />
	<div id="commentList">

		<c:set var="i" value="0" />
		<c:forEach var="comment" items="${board.commentList}">
			<c:set var="i" value="${ i+1}" />
			<div id="comment${i}">
				<div class="row">
					<div class="col-md-1">
						<div>
							<img alt="" class="img-circle"
								src="../../images/${comment.userImg }" width="
								70px"
								height="70px" style="margin-top: 1%">
						</div>
					</div>
					<div class="col-md-11" id="commentBody${i}">
						<div>
							<div class="row">
								<div class="col-md-7" align="left">
									<div style="margin-left: 2%; margin-right: 2%;">${comment.nickname }/${comment.commentDate}</div>
								</div>
								<div class="col-md-5">
									<div align="right">
										 <c:if test="${user.nickname eq comment.nickname}">
										<a style="margin-left: 2%; color: black" class="updateComment"
											title="${comment.commentNo },commentContent${i},commentBody${i},replyCnt${i}">수정</a>
										<a style="margin-left: 2%; color: black" class="removeComment"
											title="${comment.commentNo}">삭제</a>
										<%-- <a
											style="margin-left: 2%; color: black" onclick="removeComment('${comment.commentNo}')">삭제</a> --%>
										</c:if> 
									</div>
								</div>
							</div>
						</div>
						<div style="margin-left: 2%; margin-right: 2%; margin-top: 1%"
							id="commentContent${i}">${comment.commentContent }</div>
					</div>
					<div align="right" style="margin-right: 2%;">
						<a style="color: black" class="replyList"
							title="${comment.commentNo},${comment.replyCnt},comment${i}ReplyList">답글(${comment.replyCnt})개
							보기</a>
					</div>
				</div>
			</div>
			<hr />
			<div id="comment${i}ReplyList">
				<!-- 여기에 답글 입력부분을 보여준다. -->
			</div>
		</c:forEach>
	</div>
</div>

<%-- <div class="row">
	<div class="col-md-1">
		<div>
			<img alt="" class="img-circle" src="../img/001.jpg" width="70px"
				height="70px" style="margin-top: 1%">
		</div>
	</div>
	<div class="col-md-11">
		<div>
			<div class="row">
				<div class="col-md-2" align="left">
					<div style="margin-left: 15%; margin-right: 2%;">닉네임/날짜</div>
				</div>
				<div class="col-md-10">
					<div align="right">
						<a style="margin-left: 2%; color: black">수정</a> <a
							style="margin-left: 2%; color: black">삭제</a>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-left: 2%; margin-right: 2%; margin-top: 1%">내용......</div>
	</div>
	<div align="right" style="margin-right: 2%;">
		<a style="color: black">답글(갯수)개 보기</a>
	</div>
</div>
<hr />
<div class="row">
	<div class="col-md-1" align="center">
		<span class="glyphicon glyphicon-arrow-right"
			style="margin-top: 2%; font-size: 1.5em; margin-left: 2%"></span>
	</div>
	<div class="col-md-1">
		<img alt="" class="img-circle" src="../img/001.jpg" width="70px"
			height="70px" style="margin-top: 1%">
	</div>
	<div class="col-md-10">
		<input type="hidden" id="contentNo" value="${board.boardNo }">
		<textarea class="form-control" id="commentContent"
			name="commentContent"
			style="margin-left: 2%; margin-rghit: 2%; width: 98%; height: 80px"
			placeholder="답글을 작성해주세요"></textarea>

	</div>
</div>
<div class="form-group" align="right">
	<button type="submit" class="btn btn-warning" style="margin-top: 1%"
		id="commentSubmit">댓글작성</button>
</div>
<hr />
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-1">
		<div>
			<img alt="" class="img-circle" src="../img/001.jpg" width="70px"
				height="70px" style="margin-top: 1%">
		</div>
	</div>
	<div class="col-md-10">
		<div>
			<div class="row">
				<div class="col-md-2" align="left">
					<div style="margin-left: 15%; margin-right: 2%">닉네임/날짜</div>
				</div>
				<div class="col-md-10">
					<div align="right">
						<a style="color: black">수정</a><a
							style="margin-left: 2%; color: black"
							onclick="removeReply('aaa','bbb');">삭제</a>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-left: 2%; margin-right: 2%; margin-top: 1%">내용......</div>
	</div>
</div>
<hr />

 --%>