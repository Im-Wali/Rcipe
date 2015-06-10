<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	$("document").ready(function() {
		$("#favoriteAddOK").click(function(event) {
			var recipeNo = document.getElementById("recipeNo").value;
			var favoriteTitle = $('#favoriteTitle').val();
			alert(favoriteTitle);
			if (favoriteTitle == '') {
				alert("제목을 입력해주세요!");
				event.preventDefault();
			}else{
				$.get("${pageContext.servletContext.contextPath }/app/favorite/insertFavorite?recipeNo="+ recipeNo+ "&favorTitle="+favoriteTitle,
          function(data) {
					   
          });
			}

		});
	});
</script>

<div class="modal fade" id="modifyFavoriteAdd" tabindex="-1"
	role="dialog" aria-labelledby="modifyFavoriteAdd" aria-hidden="true">
	<div class="modal-dialog" style="border-color: white"">
		<div class="modal-content" style="border-color: white"">
			<div class="modal-header" style="border-color: white"border-color:black">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">즐겨찾기 추가</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="control-label" style="margin-bottom: 10px;">제목</label>
					<input type="text" class="form-control" id="favoriteTitle"
						name="favoriteTitle" value="${ recipe.recipeTitle }">
					<div class="modal-footer">
						<button class="btn btn-warning" id="favoriteAddOK"  data-backdrop="false" data-dismiss="modal" aria-label="Close">추가 확인</button>
						<!--          <input type="image" src="login.gif" alt="로그인" /> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
