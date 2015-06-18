<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
	<h4>댓글</h4>
</div>
<input type="hidden" id="content" value="${content}">
<input type="hidden" id="contentNo" value="">
<input type="hidden" id="userImg" value="${user.userImage}">
<input type="hidden" id="userNickname" value="${user.nickname}">
<div id="commentContainer">
	<from action="#" method="post">
	<div class="row">
		<div class="col-md-1">
			<c:if test="${user.userImage !=null}">
				<img alt="" class="img-circle"
					src="../../images/${comment.userImg }" width="
								70px"
					height="70px" style="margin-top: 1%">
			</c:if>
			<c:if test="${user.userImage == null}">
				<img alt="" class="img-circle" src="../../images/userIcon.png"
					width="
								70px" height="70px" style="margin-top: 1%">
			</c:if>
		</div>
		<div class="col-md-11">
			<!-- <input type="hidden" id="contentNo" value="10089"> -->
			<textarea class="form-control" id="commentContent"
				name="commentContent"
				style="margin-left: 2%; margin-rghit: 2%; width: 98%; height: 80px"
				placeholder="댓글을 작성해주세요"></textarea>

			<div class="form-group" align="right">
				<button type="submit" class="btn btn-info"
					style="margin-top: 1%;" id="commentSubmit">댓글작성</button>
			</div>
		</div>
	</div>
	</from>
	<hr />
	<div id="commentList">
		<c:set var="i" value="0" />
		<c:if test="${content==1}">
			<c:set var="item" value="${board.commentList}" />
		</c:if>
		<c:if test="${content==0}">
			<c:set var="item" value="${recipe.commentList}" />
		</c:if>
		<c:forEach var="comment" items="${item}">
			<c:set var="i" value="${ i+1}" />
			<div id="comment${i}">
				<div class="row">
					<div class="col-md-1">
						<div>
							<c:if test="${user.userImage !=null}">
								<img alt="" class="img-circle"
									src="../../images/${comment.userImg }" width="
								70px"
									height="70px" style="margin-top: 1%">
							</c:if>
							<c:if test="${user.userImage == null}">
								<img alt="" class="img-circle" src="../../images/userIcon.png"
									width="
								70px" height="70px" style="margin-top: 1%">
							</c:if>
						</div>
					</div>
					<div class="col-md-11" id="commentBody${i}">
						<div>
							<div class="row">
								<div class="col-md-7" align="left">
									<div
										style="margin-left: 2%; margin-right: 2%; font-family: monospace;">${comment.nickname }/${comment.commentDate}</div>
								</div>
								<div class="col-md-5">
									<div align="right">
										<c:if test="${user.nickname eq comment.nickname}">
											<a style="margin-left: 2%; color: blue; cursor: pointer"
												class="updateComment"
												title="${comment.commentNo },commentContent${i},commentBody${i},replyCnt${i}">수정</a>
											<a style="margin-left: 2%; color: red; cursor: pointer"
												class="removeComment" title="${comment.commentNo}">삭제</a>
											<%-- <a
											style="margin-left: 2%; color: black" onclick="removeComment('${comment.commentNo}')">삭제</a> --%>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<div style="margin-left: 2%; margin-right: 2%; margin-top: 1%;"
							id="commentContent${i}">${comment.commentContent }</div>
					</div>
					<div align="right" style="margin-right: 2%;">
						<a style="color: purple; cursor: pointer" class="replyList  "
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
<script src="${pageContext.servletContext.contextPath}/js/comment.js"></script>
