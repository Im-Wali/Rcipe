<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$("document")
			.ready(
					function() {
						$("#removeRecipeBtn")
								.click(
										function(event) {
											var recipeNo = document
													.getElementById("recipeNo").value;
											var imagePath = document
					                          .getElementById("imagePath").value;
											
												$
														.get(
																"${pageContext.servletContext.contextPath }/app/recipe/deleteRecipe?recipeNo="
																		+ recipeNo+"&imagePath="+imagePath,
																function(data) {
																			alert('삭제되었습니다.');
																			location.href = 'http://localhost:8080/rcipe/app/recipe/getRecipeList';
																});
											

										});
					});
</script>

<div class="modal fade" id="modifyRecipeRemove" tabindex="-1"
	role="dialog" aria-labelledby="modifyRecipeRemove" aria-hidden="true">
	<div class="modal-dialog" style="border-color: white"">
		<div class="modal-content" style="border-color: white"">
			<div class="modal-header" style="border-color: white"border-color:black">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">레시피 삭제</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="control-label" style="margin-bottom: 10px;">${recipe.recipeTitle }를 정말 삭제하시겠습니까?</label>
					<div class="modal-footer">
						<button class="btn btn-warning" id="removeRecipeBtn"
							data-backdrop="false" data-dismiss="modal" aria-label="Close">삭제</button>
						<!--          <input type="image" src="login.gif" alt="로그인" /> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
