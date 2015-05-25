<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	function removeComment(str,id){
		$.post("../app/",)
	};
	
	function addComment(str,id){}
	
	function addCommentReply(str,id){}
	
});
</script>
<div align="center">
	<h4>댓글</h4>
</div>
<from action="#" method="post">
<div class="row">
	<div class="col-md-1">
		<img alt="" class="img-circle" src="../img/001.jpg" width="70px"
			height="70px" style="margin-top: 1%">
	</div>
	<div class="col-md-11">
		<textarea class="form-control" id="commentContent"
			name="commentContent"
			style="margin-left: 2%; margin-rghit: 2%; width: 98%; height: 80px"
			placeholder="댓글을 작성해주세요"></textarea>

	</div>
</div>
<div class="form-group" align="right">
	<button type="submit" class="btn btn-warning" style="margin-top: 1%">댓글작성</button>
</div>
</from>
<hr/>
<div class="row">
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
						<a style="color:black">답글</a> <a style="margin-left: 2%;color:black">수정</a> <a
							style="margin-left:2%;color:black">삭제</a>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-left: 2%; margin-right: 2%; margin-top: 1%">내용......</div>
	</div>
	<div align="right" style="margin-right: 2%;"><a style="color:black">답글(갯수)개 보기</a></div>
</div>
<hr/>
<div class="row">
	<div class="col-md-1" align="center"><span class="glyphicon glyphicon-arrow-right" style="margin-top:2%;font-size:1.5em;margin-left:2%"></span></div>
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
						<a style="color:black">수정</a><a
							style="margin-left: 2%;color:black">삭제</a>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-left: 2%; margin-right: 2%; margin-top: 1%">내용......</div>
	</div>
</div>
<hr/>

